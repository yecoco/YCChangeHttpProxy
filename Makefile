export THEOS_DEVICE_IP = 10.0.1.183
export ARCHS = armv7 arm64
export TARGET = iphone:clang:latest:9.0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = HttpProxyChanger
HttpProxyChanger_FILES = main.m RBAppDelegate.m RBRootViewController.m WiFiProxy.m
HttpProxyChanger_FRAMEWORKS = UIKit CoreGraphics Foundation SystemConfiguration

include $(THEOS_MAKE_PATH)/application.mk

after-stage::
	$(ECHO_NOTHING)chmod +s $(THEOS_STAGING_DIR)/Applications/HttpProxyChanger.app/HttpProxyChanger$(ECHO_END)

after-install::
	install.exec "su mobile -c uicache"
	install.exec "killall \"HttpProxyChanger\"" || true

SUBPROJECTS += iosrebooter
include $(THEOS_MAKE_PATH)/aggregate.mk
