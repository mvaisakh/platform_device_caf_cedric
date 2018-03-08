
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
