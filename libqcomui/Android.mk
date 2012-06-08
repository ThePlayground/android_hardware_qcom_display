LOCAL_PATH := $(call my-dir)

#Headers to export
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := qcom/display
LOCAL_COPY_HEADERS := qcom_ui.h
include $(BUILD_COPY_HEADERS)

include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := qcom/display/utils
LOCAL_COPY_HEADERS := utils/IdleInvalidator.h
LOCAL_COPY_HEADERS += utils/profiler.h
include $(BUILD_COPY_HEADERS)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        qcom_ui.cpp \
        utils/profiler.cpp \
        utils/IdleInvalidator.cpp

ifeq ($(TARGET_BOARD_PLATFORM),qsd8k) # these are originally for 7x27a
    LOCAL_CFLAGS += -DCHECK_FOR_EXTERNAL_FORMAT
    LOCAL_CFLAGS += -DBYPASS_EGLIMAGE
endif

LOCAL_SHARED_LIBRARIES := \
        libutils \
        libcutils \
        libmemalloc \
        libui \
        libEGL \
        libskia

LOCAL_C_INCLUDES := $(TOP)/hardware/qcom/display/libgralloc \
                    $(TOP)/frameworks/base/services/surfaceflinger \
                    $(TOP)/external/skia/include/core \
                    $(TOP)/external/skia/include/images

LOCAL_CFLAGS := -DLOG_TAG=\"libQcomUI\"

ifneq ($(BOARD_USES_QCOM_HARDWARE),true)
    LOCAL_CFLAGS += -DNON_QCOM_TARGET
else
    LOCAL_CFLAGS += -DQCOM_HARDWARE
    LOCAL_SHARED_LIBRARIES += libmemalloc
endif

LOCAL_CFLAGS += -DDEBUG_CALC_FPS -DQCOM_HARDWARE

LOCAL_MODULE := libQcomUI
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
