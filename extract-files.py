#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.file import File
from extract_utils.fixups_blob import (
    BlobFixupCtx,
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixup_remove_arch_suffix,
    lib_fixup_vendorcompat,
    lib_fixups_user_type,
    libs_clang_rt_ubsan,
    libs_proto_3_9_1,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/xiaomi/socrates',
    'hardware/qcom-caf/wlan',
    'hardware/qcom-caf/sm8550',
    'hardware/xiaomi',
    'vendor/qcom/opensource/commonsys-intf/display',
    'vendor/qcom/opensource/dataservices',
]


def lib_fixup_camera_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}-camera'


def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}-{partition}' if partition == 'vendor' else None


lib_fixups: lib_fixups_user_type = {
    libs_clang_rt_ubsan: lib_fixup_remove_arch_suffix,
    libs_proto_3_9_1: lib_fixup_vendorcompat,
    (
        'vendor.qti.imsrtpservice@3.0',
        'vendor.qti.imsrtpservice@3.1',
        'vendor.qti.diaghal@1.0',
    ): lib_fixup_vendor_suffix,
    (
        'vendor/lib64/camera/libPlatformValidatorShared.so',
    ): lib_fixup_camera_suffix,
    (
        'audio.primary.kalama',
        'libagmclient',
        'libagmmixer',
        'libpalclient',
        'libwpa_client',
    ): lib_fixup_remove,
}


def blob_fixup_test_flag(
    ctx: BlobFixupCtx,
    file: File,
    file_path: str,
    *args,
    **kargs,
):
    with open(file_path, 'rb+') as f:
        f.seek(1337)
        f.write(b'\x01')


blob_fixups: blob_fixups_user_type = {
    ('odm/etc/camera/enhance_motiontuning.xml',
     'odm/etc/camera/motiontuning.xml',
     'odm/etc/camera/night_motiontuning.xml') : blob_fixup()
        .regex_replace('xml=version', 'xml version'),
    'vendor/bin/hw/android.hardware.security.keymint-service-qti' : blob_fixup()
        .add_needed('android.hardware.security.rkp-V3-ndk.so'),
    'odm/lib64/libmt@1.3.so' : blob_fixup()
        .replace_needed('libcrypto.so', 'libcrypto-v33.so'),
    'vendor/lib64/c2.dolby.client.so' : blob_fixup()
        .add_needed('dolbycodec_shim.so'),
    ('vendor/etc/seccomp_policy/atfwd@2.0.policy',
     'vendor/etc/seccomp_policy/wfdhdcphalservice.policy',
     'vendor/etc/seccomp_policy/modemManager.policy') : blob_fixup()
        .add_line_if_missing('gettid: 1'),
    'vendor/etc/seccomp_policy/qwesd@2.0.policy' : blob_fixup()
        .add_line_if_missing('gettid: 1')
        .add_line_if_missing('pipe2: 1'),
    'vendor/etc/qcril_database/upgrade/config/6.0_config.sql' : blob_fixup()
        .regex_replace('(persist\\.vendor\\.radio\\.redir_party_num.*)true', '\\1false'),
    'vendor/etc/init/hw/init.qcom.rc' : blob_fixup()
        .regex_replace('/vendor/bin/ssgqmigd\\b', '/vendor/bin/ssgqmigd64'),
    'vendor/lib64/libqtikeymint.so' : blob_fixup()
        .add_needed('android.hardware.security.rkp-V3-ndk.so'),
    'vendor/lib64/vendor.libdpmframework.so' : blob_fixup()
        .add_needed('libhidlbase_shim.so'),
    'vendor/lib64/libqcodec2_core.so' : blob_fixup()
        .add_needed('libcodec2_shim.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'socrates',
    'xiaomi',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    check_elf=True,
    add_firmware_proprietary_file=True, 
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
