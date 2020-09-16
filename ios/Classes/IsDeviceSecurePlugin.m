#import "IsDeviceSecurePlugin.h"
#if __has_include(<is_device_secure/is_device_secure-Swift.h>)
#import <is_device_secure/is_device_secure-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "is_device_secure-Swift.h"
#endif

@implementation IsDeviceSecurePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIsDeviceSecurePlugin registerWithRegistrar:registrar];
}
@end
