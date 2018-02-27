TARGET_USES_QCOM_BSP := false

DEVICE_PACKAGE_OVERLAYS := device/motorola/cedric/overlay

BOARD_HAVE_QCOM_FM := true

TARGET_KERNEL_VERSION := 3.18

# Enable features in video HAL that can compile only on this platform
TARGET_USES_MEDIA_EXTENSIONS := true

-include $(QCPATH)/common/config/qtic-config.mk

# media_profiles and media_codecs xmls for msm8937
PRODUCT_COPY_FILES += device/motorola/cedric/media/media_profiles_8937.xml:system/etc/media_profiles.xml \
                      device/motorola/cedric/media/media_profiles_8937.xml:system/etc/media_profiles_vendor.xml \
                      device/motorola/cedric/media/media_profiles_8956.xml:system/etc/media_profiles_8956.xml \
                      device/motorola/cedric/media/media_profiles_8956.xml:system/etc/media_profiles_8956.xml \
                      device/motorola/cedric/media/media_codecs_8937.xml:system/etc/media_codecs.xml \
                      device/motorola/cedric/media/media_codecs_8956.xml::system/etc/media_codecs_8956.xml \
                      device/motorola/cedric/media/media_codecs_performance_8937.xml:system/etc/media_codecs_performance.xml \
                      device/motorola/cedric/media/media_codecs_vendor_audio.xml:system/etc/media_codecs_vendor_audio.xml

# video seccomp policy files
PRODUCT_COPY_FILES += \
    device/motorola/cedric/seccomp/mediacodec-seccomp.policy:system/etc/seccomp_policy/mediacodec.policy \
    device/motorola/cedric/seccomp/mediaextractor-seccomp.policy:system/etc/seccomp_policy/mediaextractor.policy

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.vidc.disable.split.mode=1

PRODUCT_PROPERTY_OVERRIDES += \
       dalvik.vm.heapminfree=6m \
       dalvik.vm.heapstartsize=14m

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_NAME := cedric
PRODUCT_DEVICE := cedric

PRODUCT_BOOT_JARS += qcom.fmradio

DEVICE_MANIFEST_FILE := device/motorola/cedric/configs/manifest.xml
DEVICE_MATRIX_FILE   := device/motorola/cedric/configs/compatibility_matrix.xml

ifneq ($(strip $(QCPATH)),)
    PRODUCT_BOOT_JARS += WfdCommon
    PRODUCT_BOOT_JARS += tcmiface
endif

# Audio configuration file
-include $(TOPDIR)hardware/qcom/audio/configs/msm8937/msm8937.mk

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

PRODUCT_PACKAGES += android.hardware.media.omx@1.0-impl

# ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

# Display/Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    android.hardware.configstore@1.0-service


# Feature definition files for msm8937
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:systemetc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

#FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

# MotoActions
PRODUCT_PACKAGES += \
    MotoActions

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom

PRODUCT_PACKAGES += wcnss_service

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/motorola/cedric/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

#wlan driver
PRODUCT_COPY_FILES += \
    device/motorola/cedric/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/motorola/cedric/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin \
    device/motorola/cedric/WCNSS_wlan_dictionary.dat:persist/WCNSS_wlan_dictionary.dat

ifneq ($(TARGET_DISABLE_DASH), true)
    PRODUCT_BOOT_JARS += qcmediaplayer
endif

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

#for wlan
PRODUCT_PACKAGES += \
    wificond \
    wifilogd

PRODUCT_PACKAGES += telephony-ext
PRODUCT_BOOT_JARS += telephony-ext

# Defined the locales
PRODUCT_LOCALES += th_TH vi_VN tl_PH hi_IN ar_EG ru_RU tr_TR pt_BR bn_IN mr_IN ta_IN te_IN zh_HK \
        in_ID my_MM km_KH sw_KE uk_UA pl_PL sr_RS sl_SI fa_IR kn_IN ml_IN ur_IN gu_IN or_IN

# Powerhint configuration file
PRODUCT_COPY_FILES += \
     device/motorola/cedric/powerhint.xml:system/etc/powerhint.xml

#Healthd packages
PRODUCT_PACKAGES += android.hardware.health@1.0-impl \
                   android.hardware.health@1.0-convert \
                   android.hardware.health@1.0-service \
                   libhealthd.msm

#for android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

# Sensor HAL conf file
PRODUCT_COPY_FILES += \
     device/motorola/cedric/sensors/hals.conf:system/etc/sensors/hals.conf

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service \
    android.hardware.power@1.0-impl

PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Camera configuration file. Shared by passthrough/binderized camera HAL
PRODUCT_PACKAGES += camera.device@3.2-impl
PRODUCT_PACKAGES += camera.device@1.0-impl
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-impl

# Enable binderized camera HAL
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-service

PRODUCT_PACKAGES += \
    vendor.display.color@1.0-service \
    vendor.display.color@1.0-impl

PRODUCT_PACKAGES += \
    libandroid_net \
    libandroid_net_32

#Enable Lights Impl HAL Compilation
PRODUCT_PACKAGES += android.hardware.light@2.0-impl

#Thermal
PRODUCT_PACKAGES += android.hardware.thermal@1.0-impl \
                    android.hardware.thermal@1.0-service

PRODUCT_COPY_FILES += device/motorola/cedric/configs/thermal/thermal-engine-cedric-India.conf:system/etc/thermal-engine-cedric-India.conf \
	    	      device/motorola/cedric/configs/thermal/thermal-engine-cedric.conf:system/etc/thermal-engine-cedric.conf \
		      device/motorola/cedric/configs/thermal/thermal-engine-montana.conf:system/etc/thermal-engine-montana.conf
#DSI
PRODUCT_COPY_FILES += device/motorola/cedric/configs/dsi_config.xml:system/etc/data/dsi_config.xml

#netmgr
PRODUCT_COPY_FILES += device/motorola/cedric/configs/netmgr_config.xml:system/etc/data/netmgr_config.xml

#RIDL qdss
PRODUCT_COPY_FILES += device/motorola/cedric/configs/RIDL/qdss.cfg:system/vendor/etc/RIDL/qdss.cfg

TARGET_SUPPORT_SOTER := true

#Enable AOSP KEYMASTER and GATEKEEPER HIDLs
PRODUCT_PACKAGES += android.hardware.gatekeeper@1.0-impl \
                    android.hardware.gatekeeper@1.0-service \
                    android.hardware.keymaster@3.0-impl \
                    android.hardware.keymaster@3.0-service

PRODUCT_PROPERTY_OVERRIDES += rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so

