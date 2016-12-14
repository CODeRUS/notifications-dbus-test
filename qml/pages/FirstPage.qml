import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.dbus 2.0
import org.nemomobile.notifications 1.0


Page {
    id: page

    Notification {
        id: notification
        category: "x-nemo.example"
        appName: "Example App"
        appIcon: "/usr/share/example-app/icon-l-application"
        summary: "Notification summary"
        body: "Notification body"
        previewSummary: "Notification preview summary"
        previewBody: "Notification preview body"
        remoteActions: [ {
            "name": "default",
            "displayName": "Do something",
            "icon": "icon-s-do-it",
            "service": "com.example.service",
            "path": "/com/example/service",
            "iface": "com.example.service",
            "method": "trigger",
            "arguments": [ argument ]
        }]
        property string argument
    }

    DBusAdaptor {
        id: adaptor
        service: 'com.example.service'
        iface: 'com.example.service'
        path: '/com/example/service'

        xml: '  <interface name="com.example.service">\n' +
             '    <method name="trigger">\n' +
             '      <arg name="param" type="s" direction="in"/>\n"' +
             '    </method">\n' +
             '  </interface>\n'

        function trigger(param) {
            console.log('### param:', param)
            __silica_applicationwindow_instance.activate()
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("UI Template")
            }
            Label {
                x: Theme.paddingLarge
                text: qsTr("Application notification: %1").arg(notification.replacesId)
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                id: field
                width: parent.width
                text: "param value"
            }
            Button {
                text: qsTr("Publish notification")
                onClicked: {
                    notification.argument = field.text
                    notification.publish()
                }
            }
        }
    }
}

