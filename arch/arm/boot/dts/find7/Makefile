ifeq ($(CONFIG_OF),y)
ifeq ($(CONFIG_OPPO_DEVICE_FIND7),y)
	dtb-$(CONFIG_ARCH_MSM8974)	+= msm8974pro-ab-find7.dtb
	dtb-$(CONFIG_ARCH_MSM8974)	+= msm8974pro-ac-find7s.dtb
endif
ifeq ($(CONFIG_OPPO_DEVICE_FIND7OP),y)
	dtb-$(CONFIG_ARCH_MSM8974)	+= msm8974pro-ac-find7op.dtb
endif
endif
DTB_NAMES := $(subst $\",,$(CONFIG_BUILD_ARM_APPENDED_DTB_IMAGE_NAMES))
ifneq ($(DTB_NAMES),)
DTB_LIST := $(addsuffix .dtb,$(DTB_NAMES))
else
DTB_LIST := $(dtb-y)
endif

targets += dtbs
targets += $(addprefix ../../, $(DTB_LIST))

$(obj)/../../%.dtb: $(src)/%.dts FORCE
	$(call if_changed_dep,dtc)

dtbs: $(addprefix $(obj)/../../,$(DTB_LIST))

clean-files := *.dtb

