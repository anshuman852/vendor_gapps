# Copyright (C) 2017 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq ($(TARGET_ARCH),)
$(error "GAPPS: TARGET_ARCH is undefined")
endif

ifneq ($(TARGET_ARCH),arm)
ifneq ($(TARGET_ARCH),arm64)
$(error "GAPPS: Only arm and arm64 are allowed")
endif
endif

ifeq ($(TARGET_DENSITY),)
$(error "GAPPS: TARGET_DENSITY is undefined")
endif

ifeq ($(filter ldpi mdpi hdpi xhdpi xxhdpi xxxhdpi,$(TARGET_DENSITY)),)
$(error "GAPPS: $(TARGET_DENSITY) isn't valid TARGET_DENSITY")
endif

#inherit common gapps
$(call inherit-product, vendor/gapps/common-blobs.mk)

# Include package overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/gapps/overlay/

ifeq ($(IS_PHONE),true)
PRODUCT_PACKAGES += \
    PrebuiltBugle \
    GoogleDialer \
    com.google.android.dialer.support
endif

# /app
PRODUCT_PACKAGES += \
    CalendarGooglePrebuilt \
    Chrome \
    FaceLock \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    Photos \
    PrebuiltDeskClockGoogle \
    talkback \
    CalculatorGooglePrebuilt \
    LatinIMEGooglePrebuilt \
    GoogleCalendarSyncAdapter \
    GoogleExtShared

# /framework
PRODUCT_PACKAGES += \
    com.google.android.camera.experimental2017 \
    com.google.android.maps \
    com.google.widevine.software.drm \
    com.google.android.media.effects

# /priv-app
PRODUCT_PACKAGES += \
    AndroidPlatformServices \
    ConfigUpdater \
    ConnMetrics \
    GmsCoreSetupPrebuilt \
    GoogleBackupTransport \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    GooglePartnerSetup \
    GoogleServicesFramework \
    Phonesky \
    PrebuiltGmsCore \
    SetupWizard \
    Velvet \
    GoogleContacts \
    GoogleExtServices

# /symlinks
PRODUCT_PACKAGES += \
    libfacenet.so
