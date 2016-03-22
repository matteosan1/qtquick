#include <QtDebug>
#include <QString>
#include <QHash>
#include <QGuiApplication>
#include <QtQml>
#include <QQuickView>
#include <QtSql>
#include <QSqlQueryModel>

QSqlError initDb()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    // Open database file. The driver creates a new file if it doesn't exist yet.
    db.setDatabaseName("mylibrary.sqlite");
    if (!db.open())
        return db.lastError();

    QStringList tables = db.tables();
    if (tables.contains("books", Qt::CaseInsensitive)) {
        // DB has already been populated
        return QSqlError();
    }

    QSqlQuery query;
    if (!query.exec(QLatin1String("create table books(title varchar, author varchar)")))
        return query.lastError();
    if (!query.prepare(QLatin1String("insert into books(title, author) values(?, ?)")))
        return query.lastError();

    auto addBook = [&] (const QString& title, const QString& author) {
        query.addBindValue(title);
        query.addBindValue(author);
        query.exec();
    };

    addBook("Mademoiselle de Maupin", "T. Gautier");
    addBook("Der Nachsommer", "A. Stifter");
    addBook("L'Education sentimentale", "G. Flaubert");
    addBook("Voyna i mir", "L. Tolstoy");
    addBook("Mysterier", "K. Hamsun");
    addBook("The Sound and the Fury", "W. Faulkner");
    addBook("Tender is the Night", "F. Scott Fitzgerald");

    return QSqlError();
}

class SqlModel : public QSqlQueryModel
{
    Q_OBJECT

public:
    SqlModel(QObject* parent = 0)
        : QSqlQueryModel(parent)
    {
        roleNamesHash.insert(Qt::UserRole,      QByteArray("title"));
        roleNamesHash.insert(Qt::UserRole + 1,  QByteArray("author"));
    }

    QVariant data(const QModelIndex& index, int role) const
    {
        if(role < Qt::UserRole)
            return QSqlQueryModel::data(index, role);

        QSqlRecord r = record(index.row());
        return r.value(role - Qt::UserRole);
    }

    QHash<int, QByteArray> roleNames() const { return roleNamesHash; }

private:
    QHash<int, QByteArray> roleNamesHash;
};

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);

    auto err = initDb();
    if (err.type() != QSqlError::NoError) {
        qCritical() << err.text();
        return 1;
    }

    SqlModel sqlModel;
    sqlModel.setQuery("SELECT title, author FROM books");

    QQuickView view;
    QQmlContext *context = view.rootContext();
    context->setContextProperty("sqlModel", &sqlModel);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:///main.qml"));
    view.show();

    return app.exec();
}

#include "main.moc"
