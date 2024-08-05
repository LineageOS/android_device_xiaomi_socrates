#include <private/color_params.h>

#define LOG_TAG "SDM-SHIM"
#include <log/log.h>

#define LIBSDMCORE "/vendor/lib64/libsdmcore.so"
#define PPHWATTRIBUTES_SET_SYM "_ZN3sdm14PPHWAttributes3SetERKNS_14HWResourceInfoERKNS_11HWPanelInfoERKNS_25DisplayConfigVariableInfoERKNS_16PPFeatureVersionEPNS_20DppsControlInterfaceE"

#include <dlfcn.h>

namespace sdm {

void PPHWAttributes::Set(
        const HWResourceInfo &hw_res,
        const HWPanelInfo &panel_info,
        const DisplayConfigVariableInfo &attr,
        const PPFeatureVersion &feature_ver,
        DppsControlInterface *intf){
    ALOGI("Start custom PPHWAttributes::Set");

    // Open the library
    void *handle = dlopen(LIBSDMCORE, RTLD_LOCAL | RTLD_LAZY);
    if (!handle) {
        ALOGE("Failed to open the library %s", LIBSDMCORE);
        return;
    }

    // Load the default symbol
    typedef void (*orig_t)(PPHWAttributes*, const HWResourceInfo&, const HWPanelInfo&, const DisplayConfigVariableInfo&, const PPFeatureVersion&, DppsControlInterface*);
    orig_t orig_f = (orig_t) dlsym(handle, PPHWATTRIBUTES_SET_SYM);

    if (dlerror()) {
        ALOGE("Failed to load the symbol %s", PPHWATTRIBUTES_SET_SYM);
        return;
    }

    // Execute the default symbol
    orig_f(this, hw_res, panel_info, attr, feature_ver, intf);

    // Move the version struct by -8 bytes
    std::memmove(&panel_name[248], &version, sizeof(PPFeatureVersion));

    // Ensure that the reduced panel_name is a string
    panel_name[247] = '\0';

    dlclose(handle);
    ALOGI("End custom PPHWAttributes::Set");
}

} // namespace sdm
