#ifndef BridgeModule_h
#define BridgeModule_h

/**
 * Same as RCT_EXPORT_MODULE, but uses __attribute__((constructor)) for module
 * registration. Useful for registering swift classes that forbids use of load
 * Used in RCT_EXTERN_REMAP_MODULE
 */
#define RCT_EXPORT_MODULE_NO_LOAD(js_name, objc_name) \
RCT_EXTERN void RCTRegisterModule(Class); \
+ (NSString *)moduleName { return @#js_name; } \
__attribute__((constructor)) static void \
RCT_CONCAT(initialize_, objc_name)() { RCTRegisterModule([objc_name class]); }

#define RCT_EXTERN_MODULE_SWIFT(objc_name, objc_supername) \
RCT_EXTERN_REMAP_MODULE_SWIFT(, objc_name, objc_supername)

/**
 * Like RCT_EXTERN_MODULE, but allows setting a custom JavaScript name.
 */
#define RCT_EXTERN_REMAP_MODULE_SWIFT(js_name, objc_name, objc_supername) \
objc_name : objc_supername \
@end \
@interface objc_name (RCTExternModule) <RCTBridgeModule> \
@end \
@implementation objc_name (RCTExternModule) \
RCT_EXPORT_MODULE_NO_LOAD(js_name, objc_name)


#endif /* BridgeModule_h */
