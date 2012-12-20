#Enables the listed display HAL modules

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
ifeq ($(TARGET_BOARD_PLATFORM),qsd8k)
	display-hals := libhwcomposer libgenlock libgralloc libcopybit
else
	display-hals := libhwcomposer liboverlay libgenlock libgralloc libcopybit
endif
	display-hals += libtilerenderer libqcomui
	include $(call all-named-subdir-makefiles,$(display-hals))
endif