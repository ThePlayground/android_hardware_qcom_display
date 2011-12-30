LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        qcom_ui.cpp

ifeq ($(call is-board-platform,msm7627a),true)
      LOCAL_CFLAGS += -DBYPASS_EGLIMAGE
endif

LOCAL_SHARED_LIBRARIES := \
        libutils \
        libcutils \
        libmemalloc \
        libui \
        libEGL

LOCAL_C_INCLUDES := $(TOP)/hardware/qcom/display/libgralloc \
LOCAL_CFLAGS := -DLOG_TAG=\"libQcomUI\"
LOCAL_MODULE := libQcomUI
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)