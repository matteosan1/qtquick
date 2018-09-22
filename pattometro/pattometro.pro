QT += qml quick texttospeech

android: QT += androidextras
CONFIG += c++11

SOURCES += main.cpp \
    patimer.cpp \
    notificationclient.cpp

OTHER_FILES += \
    qml/main.qml \
    android/src/org/qtproject/example/notification/NotificationClient.java

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    patimer.h \
    notificationclient.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

target.path = $$[QT_INSTALL_EXAMPLES]/androidextras/notification
INSTALLS += target
