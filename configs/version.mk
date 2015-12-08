# Versioning System
PRODUCT_VERSION_MAJOR = 2
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 1
ifdef SCREWD_BUILD_EXTRA
    SCREWD_POSTFIX := -$(SCREWD_BUILD_EXTRA)
endif
ifndef SCREWD_BUILD_TYPE
    SCREWD_BUILD_TYPE := BETA
    SCREWD_POSTFIX := $(shell date +"%Y%m%d-%H%M")
endif

# Set all versions
SCREWD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(SCREWD_BUILD_TYPE)-$(SCREWD_POSTFIX)
SCREWD_MOD_VERSION := $(SCREWD_DEVICE)_$(SCREWD_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.ota.version=$(PRODUCT_VERSION_MAJOR)-$(SCREWD_POSTFIX) \
    ro.screwd.version=$(SCREWD_VERSION) \
    ro.modversion=$(SCREWD_MOD_VERSION) \
    ro.screwd.buildtype=$(SCREWD_BUILD_TYPE)
