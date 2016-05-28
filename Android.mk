#
# Copyright 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

ifneq ($(filter libra aqua, $(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(call all-makefiles-under,$(LOCAL_PATH))

ADSP_IMAGES := \
    adsp.b00 adsp.b01 adsp.b02 adsp.b03 adsp.b04 adsp.b05 adsp.b06 adsp.b07 \
    adsp.b08 adsp.b09 adsp.b10 adsp.b11 adsp.b12 adsp.b13 adsp.b14 adsp.b15 \
    adsp.mdn adsp.mdt

ADSP_SYMLINKS := $(addprefix $(TARGET_OUT)/vendor/firmware/,$(notdir $(ADSP_IMAGES)))
$(ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "ADSP firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(ADSP_SYMLINKS)

CMN_IMAGES := \
    cmnlib.b00 cmnlib.b01 cmnlib.b02 cmnlib.b03 cmnlib.mdt

CMN_SYMLINKS := $(addprefix $(TARGET_OUT)/vendor/firmware/,$(notdir $(CMN_IMAGES)))
$(CMN_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CMN firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CMN_SYMLINKS)

CPE_IMAGES := \
    cpe.b02 cpe.b04 cpe.b05 cpe.b06 cpe.b08 cpe.b10 cpe.b11 cpe.b12 cpe.b14 \
    cpe.b16 cpe.b18 cpe.b20 cpe.b21 cpe.mdn cpe.mdt

CPE_SYMLINKS := $(addprefix $(TARGET_OUT)/vendor/firmware/,$(notdir $(CPE_IMAGES)))
$(CPE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CPE firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CPE_SYMLINKS)

KM_IMAGES := \
    keymaste.b00 keymaste.b01 keymaste.b02 keymaste.b03 keymaste.mdt

KM_SYMLINKS := $(addprefix $(TARGET_OUT)/vendor/firmware/,$(notdir $(KM_IMAGES)))
$(KM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Keymaster firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@; \
		ln -sf /firmware/image/$(notdir $@) $(basename $@)r$(suffix $@)

ALL_DEFAULT_INSTALLED_MODULES += $(KM_SYMLINKS)

MODEM_IMAGES := \
    modem.b00 modem.b01 modem.b03 modem.b04 modem.b05 modem.b06 modem.b07 \
    modem.b08 modem.b09 modem.b10 modem.b11 modem.b12 modem.b13 modem.b14 \
    modem.b18 modem.b19 modem.b20 modem.b22 modem.mdt mba.b00 mba.mdt

MODEM_SYMLINKS := $(addprefix $(TARGET_OUT)/vendor/firmware/,$(notdir $(MODEM_IMAGES)))
$(MODEM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Modem firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MODEM_SYMLINKS)

BT_IMAGES := \
    btfw30.tlv btnv30.bin btfw32.tlv btnv32.bin

BT_SYMLINKS := $(addprefix $(TARGET_OUT)/vendor/firmware/,$(notdir $(BT_IMAGES)))
$(BT_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Bluetooth firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /bt_firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(BT_SYMLINKS)

WLAN_IMAGES := \
    bd30_a10.bin bdwlan30.bin qwlan30.bin otp30.bin utf30.bin

WLAN_SYMLINKS := $(addprefix $(TARGET_OUT)/vendor/firmware/,$(notdir $(WLAN_IMAGES)))
$(WLAN_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WLAN firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WLAN_SYMLINKS)

MISC_IMAGES := \
    cardapp.b00 cardapp.b01 cardapp.b02 cardapp.b03 cardapp.mdt data.msc \
    qmpsecap.b00 qmpsecap.b01 qmpsecap.b02 qmpsecap.b03 qmpsecap.mdt \
    sampleap.b00 sampleap.b01 sampleap.b02 sampleap.b03 sampleap.mdt

MISC_SYMLINKS := $(addprefix $(TARGET_OUT)/vendor/firmware/,$(notdir $(MISC_IMAGES)))
$(MISC_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Miscellaneous firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MISC_SYMLINKS)

WV_IMAGES := \
    widevine.b00 widevine.b01 widevine.b02 widevine.b03 widevine.mdt

WV_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(WV_IMAGES)))
$(WV_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Widevine firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/firmware/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WV_SYMLINKS)

# Read WiFi MAC Address from persist partition
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/qca_cld ; \
	ln -sf /data/misc/wifi/wlan_mac.bin $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/wlan_mac.bin)

endif
