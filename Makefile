ARCHS = arm64 arm64e

TARGET = iphone:clang:latest:16.0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ProximityDisabler

ProximityDisabler_FILES = Tweak.xm

FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
