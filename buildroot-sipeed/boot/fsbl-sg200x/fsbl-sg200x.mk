FSBL_SG200X_VERSION = 0e834f57e37a1ea213510722cfe46a0dc1994e13
FSBL_SG200X_SITE = $(call github,0x754c,fsbl,$(FSBL_SG200X_VERSION))
FSBL_SG200X_DEPENDENCIES += uboot
FSBL_SG200X_DEPENDENCIES += opensbi

FSBL_SG200X_MAKE_OPTS += CROSS_COMPILE=riscv64-unknown-linux-gnu-
FSBL_SG200X_MAKE_OPTS += CHIP_ARCH=sg200x BOOT_CPU=riscv
FSBL_SG200X_MAKE_OPTS += DDR_CFG=ddr3_1866_x16
FSBL_SG200X_MAKE_OPTS += TEST_FROM_SPINOR1=0
FSBL_SG200X_MAKE_OPTS += PAGE_SIZE_64KB=1
FSBL_SG200X_MAKE_OPTS += LOADER_2ND_PATH=$(BINARIES_DIR)/u-boot.bin
FSBL_SG200X_MAKE_OPTS += MONITOR_PATH=$(BINARIES_DIR)/fw_dynamic.bin

define FSBL_SG200X_BUILD_CMDS
        $(TARGET_CONFIGURE_OPTS) $(MAKE) $(FSBL_SG200X_MAKE_OPTS) -C $(@D)
endef

define FSBL_SG200X_INSTALL_TARGET_CMDS
        cp -fv $(@D)/build/sg200x/fip.bin $(BINARIES_DIR)/fip.bin
endef

$(eval $(generic-package))
