# Copyright (C) 2021 The OmniROM Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from dynamic_common
-include device/motorola/dynamic_common/BoardConfigDynamicCommon.mk

SM6125_PATH := device/motorola/sm6125_common

TARGET_OTA_ASSERT_DEVICE := sofiar

TARGET_BOOTLOADER_BOARD_NAME := trinket
TARGET_BOARD_PLATFORM := trinket
TARGET_BOARD_PLATFORM_GPU := qcom-adreno610

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 earlycon=msm_geni_serial,0x4a90000 loop.max_part=7 cgroup.memory=nokmem,nosocket androidboot.usbcontroller=4e00000.dwc3 printk.devkmsg=on firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/motorola/sm6125
TARGET_KERNEL_CONFIG := vendor/sofiar_defconfig
TARGET_KERNEL_VERSION := 4.14

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 116995371008

BOARD_SUPER_PARTITION_SIZE := 8690597888
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 4341104640

TARGET_SPECIFIC_HEADER_PATH := $(SM6125_PATH)/include

# FM
BOARD_HAVE_QCOM_FM := true
BOARD_HAS_QCA_FM_SOC := "cherokee"

TARGET_SYSTEM_PROP += $(SM6125_PATH)/system.prop

# Init
TARGET_INIT_VENDOR_LIB := //$(SM6125_PATH):libinit_moto_trinket

PRODUCT_SOONG_NAMESPACES += $(SM6125_PATH)
