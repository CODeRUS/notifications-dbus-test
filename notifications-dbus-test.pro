TARGET = notifications-dbus-test

CONFIG += sailfishapp

SOURCES += src/notifications-dbus-test.cpp

dbus.files = dbus/com.example.service.service
dbus.path = /usr/share/dbus-1/services/

INSTALLS += dbus

OTHER_FILES += qml/notifications-dbus-test.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/notifications-dbus-test.spec \
    translations/*.ts \
    notifications-dbus-test.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256
