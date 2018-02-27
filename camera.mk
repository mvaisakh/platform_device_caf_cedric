# Camera

TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USES_NON_TREBLE_CAMERA := true

PRODUCT_COPY_FILES += device/motorola/cedric/configs/mot_imx258_chromatix.xml:system/etc/camera/mot_imx258_chromatix.xml \
                      device/motorola/cedric/configs/mot_ov5695_chromatix.xml:system/etc/camera/mot_ov5695_chromatix.xml \
                      device/motorola/cedric/configs/msm8937_mot_camera.xml:system/etc/camera/msm8937_mot_camera.xml

