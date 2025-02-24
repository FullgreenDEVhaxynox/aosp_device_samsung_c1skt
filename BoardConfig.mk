#
# Copyright (C) 2012 The CyanogenMod Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk

-include device/samsung/c1skt-common/BoardCommonConfig.mk


# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif

# Bionic
MALLOC_IMPL := dlmalloc

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6262
BOARD_RIL_CLASS := ../../../hardware/samsung/ril
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING


# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/c1skt/bluetooth

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/smdk4412
TARGET_KERNEL_CONFIG := custom_c1skt_defconfig

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/c1skt/rootdir/fstab.smdk4x12
RECOVERY_FSTAB_VERSION := 2

# Selinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/c1skt/selinux

BOARD_SEPOLICY_UNION += \
    bluetooth.te \
    device.te \
    domain.te \
    file.te \
    file_contexts \
    gpsd.te \
    init.te \
    mediaserver.te \
    netd.te \
    nfc.te \
    rild.te \
    servicemanager.te \
    service_contexts \
    surfaceflinger.te \
    system_app.te \
    system_server.te \
    ueventd.te \
    vold.te \
    wpa_supplicant.te
#    sysinit.te

# assert
TARGET_OTA_ASSERT_DEVICE := m0,i9300,GT-I9300,c1skt,SHV-E210S,c1ktt,SHV-E210K,c1lgt,SHV-E210L

# Device specific header overrides
TARGET_SPECIFIC_HEADER_PATH := device/samsung/c1skt/include

# inherit from the proprietary version
-include vendor/samsung/c1skt/BoardConfigVendor.mk

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/c1skt/rootdir/fstab.smdk4x12
RECOVERY_FSTAB_VERSION := 2
