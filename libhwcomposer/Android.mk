COMPOSER_HW_ROOT := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),qsd8k)
    include $(COMPOSER_HW_ROOT)/qsd8k/Android.mk
else
    include $(COMPOSER_HW_ROOT)/qcom/Android.mk
endif