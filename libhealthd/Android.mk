# Copyright 2013 The Android Open Source Project
# Copyright 2016 The CyanogenMod Project

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := healthd_board_msm.cpp
LOCAL_MODULE := libhealthd.libra
LOCAL_C_INCLUDES := system/core/healthd
LOCAL_CFLAGS := -Werror
include $(BUILD_STATIC_LIBRARY)
