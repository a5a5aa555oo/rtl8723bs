# SPDX-License-Identifier: GPL-2.0

ifneq ($(KERNELRELEASE),)

r8723bs_git-y := \
		core/rtw_ap.o \
		core/rtw_btcoex.o \
	 	core/rtw_cmd.o \
		core/rtw_debug.o \
		core/rtw_efuse.o \
		core/rtw_io.o \
		core/rtw_ioctl_set.o \
		core/rtw_ieee80211.o \
		core/rtw_mlme.o \
		core/rtw_mlme_ext.o \
		core/rtw_pwrctrl.o \
		core/rtw_recv.o \
		core/rtw_rf.o \
		core/rtw_security.o \
		core/rtw_sta_mgt.o \
		core/rtw_wlan_util.o \
		core/rtw_xmit.o	\
		hal/hal_intf.o \
		hal/hal_com.o \
		hal/hal_com_phycfg.o \
		hal/hal_btcoex.o \
		hal/hal_sdio.o \
		hal/hal_pwr_seq.o \
		hal/HalPhyRf.o \
		hal/HalPwrSeqCmd.o \
		hal/odm.o \
		hal/odm_CfoTracking.o \
		hal/odm_DIG.o \
		hal/odm_DynamicBBPowerSaving.o \
		hal/odm_DynamicTxPower.o \
		hal/odm_EdcaTurboCheck.o \
		hal/odm_HWConfig.o \
		hal/odm_RegConfig8723B.o \
		hal/rtl8723b_cmd.o \
		hal/rtl8723b_dm.o \
		hal/rtl8723b_hal_init.o \
		hal/rtl8723b_phycfg.o \
		hal/rtl8723b_rf6052.o \
		hal/rtl8723b_rxdesc.o \
		hal/rtl8723bs_recv.o \
		hal/rtl8723bs_xmit.o \
		hal/sdio_halinit.o \
		hal/sdio_ops.o \
		hal/HalBtc8723b1Ant.o \
		hal/HalBtc8723b2Ant.o \
		hal/HalHWImg8723B_BB.o \
		hal/HalHWImg8723B_MAC.o \
		hal/HalHWImg8723B_RF.o \
		hal/HalPhyRf_8723B.o \
		os_dep/ioctl_cfg80211.o \
		os_dep/ioctl_linux.o \
		os_dep/mlme_linux.o \
		os_dep/osdep_service.o \
		os_dep/os_intfs.o \
		os_dep/recv_linux.o \
		os_dep/sdio_intf.o \
		os_dep/sdio_ops_linux.o \
		os_dep/wifi_regd.o \
		os_dep/xmit_linux.o

obj-m := r8723bs_git.o

ccflags-y := -I$(src)/include -I$(src)/hal

else

KVER ?= `uname -r`
KDIR ?= /lib/modules/$(KVER)/build
MODDIR ?= /lib/modules/$(KVER)/extra
BLCONF := /etc/modprobe.d/blacklist-r8723bs.conf

modules: 
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

install:
	@mkdir -pv $(MODDIR)
	strip -g r8723bs_git.ko
	install -p -m 644 r8723bs_git.ko $(MODDIR)
	echo blacklist r8723bs > $(BLCONF)
	depmod -a $(KVER)

uninstall:
	@rm -vf $(MODDIR)/r8723bs_git.ko
	@rm -vf $(BLCONF)
	depmod -a $(KVER)
	@rmdir --ignore-fail-on-non-empty $(MODDIR)

endif
