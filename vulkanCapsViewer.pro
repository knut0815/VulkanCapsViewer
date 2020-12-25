# ----------------------------------------------------
# This file is generated by the Qt Visual Studio Add-in.
# ------------------------------------------------------

TEMPLATE = app
TARGET = vulkanCapsViewer
QT += core network widgets gui
CONFIG += c++11
#CONFIG += release bad for debugging
DEFINES += QT_DLL QT_NETWORK_LIB QT_WIDGETS_LIB VK_ENABLE_BETA_EXTENSIONS
INCLUDEPATH += ./GeneratedFiles \
    . \
    ./GeneratedFiles/Release
INCLUDEPATH += "Vulkan-Headers/include"
INCLUDEPATH += "/Vulkan-Headers/include"
win32 {
    DEFINES += WIN64
    DEFINES += VK_USE_PLATFORM_WIN32_KHR
    LIBS += "$$PWD/libs/vulkan/vulkan-1.lib"
    LIBS += Advapi32.lib
}
linux:!android {
    LIBS += -lvulkan
    contains(DEFINES, X11) {
        message("Building for X11")
        QT += x11extras
        DEFINES += VK_USE_PLATFORM_XCB_KHR
    }
    contains(DEFINES, WAYLAND) {
        message("Building for Wayland")
        QT += waylandclient
        DEFINES += VK_USE_PLATFORM_WAYLAND_KHR
    }
    target.path = /usr/bin
    INSTALLS += target
    desktop.files = vulkanCapsViewer.desktop
    desktop.path = /usr/share/applications
    icon.extra = cp $$PWD/gfx/android_icon_256.png vulkanCapsViewer.png
    icon.files = vulkanCapsViewer.png
    icon.path = /usr/share/icons/hicolor/256x256/apps/
    INSTALLS += desktop icon
}
android {
    DEFINES += VK_NO_PROTOTYPES
    DEFINES += VK_USE_PLATFORM_ANDROID_KHR
    QT += androidextras
    CONFIG += mobility
    MOBILITY =
    LIBS += -landroid
}
macx {
    DEFINES += VK_USE_PLATFORM_MACOS_MVK
    VULKAN_DYLIB = /usr/local/lib/libvulkan.1.dylib
    LIBS += $$VULKAN_DYLIB -framework Cocoa -framework QuartzCore
    OBJECTIVE_SOURCES += makeviewmetal.mm
    ICON = $${PWD}/vulkanCapsViewer.icns
}
DEPENDPATH += .
MOC_DIR += ./GeneratedFiles/release
OBJECTS_DIR += release
UI_DIR += ./GeneratedFiles
RCC_DIR += ./GeneratedFiles
include(vulkanCapsViewer.pri)
win32:RC_FILE = vulkanCapsViewer.rc

HEADERS +=

SOURCES +=

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/libs/openssl/armeabi-v7a/libcrypto.so \
        $$PWD/libs/openssl/armeabi-v7a/libssl.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/libs/openssl/x86/libcrypto.so \
        $$PWD/libs/openssl/x86/libssl.so
}
