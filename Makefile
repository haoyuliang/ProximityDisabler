ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:16.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ProximityDisabler

ProximityDisabler_FILES = ProximityDisabler.xm
ProximityDisabler_CFLAGS = -fobjc-arc
ProximityDisabler_LDFLAGS = -framework UIKit -framework Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	@install_name_tool -change /usr/lib/libobjc.A.dylib @executable_path/Frameworks/libobjc.A.dylib $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/ProximityDisabler.dylib || true
