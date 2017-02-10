include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = derpi
derpi_FILES = main.m KNAppDelegate.m KNRootViewController.m
derpi_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"derpi\"" || true
