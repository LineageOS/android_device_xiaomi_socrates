$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/WCNSS_qcom_cfg.ini: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/etc/wifi/kiwi/WCNSS_qcom_cfg.ini,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/WCNSS_qcom_cfg.ini)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/WCNSS_qcom_cfg.ini
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/wlan_mac.bin: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/kiwi/wlan_mac.bin,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/wlan_mac.bin)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi/wlan_mac.bin
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/WCNSS_qcom_cfg.ini: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/etc/wifi/kiwi_v2/WCNSS_qcom_cfg.ini,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/WCNSS_qcom_cfg.ini)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/WCNSS_qcom_cfg.ini
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/wlan_mac.bin: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/kiwi_v2/wlan_mac.bin,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/wlan_mac.bin)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/kiwi_v2/wlan_mac.bin
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/WCNSS_qcom_cfg.ini: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/vendor/etc/wifi/qca6490/WCNSS_qcom_cfg.ini,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/WCNSS_qcom_cfg.ini)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/WCNSS_qcom_cfg.ini
$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/wlan_mac.bin: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/mnt/vendor/persist/qca6490/wlan_mac.bin,$(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/wlan_mac.bin)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/wlan_mac.bin
$(TARGET_OUT_VENDOR)/firmware/wlanmdsp.otaupdate: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/data/vendor/firmware/wlanmdsp.mbn,$(TARGET_OUT_VENDOR)/firmware/wlanmdsp.otaupdate)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/firmware/wlanmdsp.otaupdate
$(TARGET_OUT_VENDOR)/lib/libEGL_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libEGL_adreno.so,$(TARGET_OUT_VENDOR)/lib/libEGL_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib/libEGL_adreno.so
$(TARGET_OUT_VENDOR)/lib/libGLESv2_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libGLESv2_adreno.so,$(TARGET_OUT_VENDOR)/lib/libGLESv2_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib/libGLESv2_adreno.so
$(TARGET_OUT_VENDOR)/lib/libq3dtools_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libq3dtools_adreno.so,$(TARGET_OUT_VENDOR)/lib/libq3dtools_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib/libq3dtools_adreno.so
$(TARGET_OUT_VENDOR)/lib64/camera/aon_front.pb: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,/odm/lib64/camera/aon_front.pb,$(TARGET_OUT_VENDOR)/lib64/camera/aon_front.pb)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib64/camera/aon_front.pb
$(TARGET_OUT_VENDOR)/lib64/libEGL_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libEGL_adreno.so,$(TARGET_OUT_VENDOR)/lib64/libEGL_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib64/libEGL_adreno.so
$(TARGET_OUT_VENDOR)/lib64/libGLESv2_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libGLESv2_adreno.so,$(TARGET_OUT_VENDOR)/lib64/libGLESv2_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib64/libGLESv2_adreno.so
$(TARGET_OUT_VENDOR)/lib64/libq3dtools_adreno.so: $(LOCAL_INSTALLED_MODULE)
$(call symlink-file,,egl/libq3dtools_adreno.so,$(TARGET_OUT_VENDOR)/lib64/libq3dtools_adreno.so)
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR)/lib64/libq3dtools_adreno.so
