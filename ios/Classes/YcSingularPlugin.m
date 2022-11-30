#import "YcSingularPlugin.h"
#if __has_include(<yc_singular/yc_singular-Swift.h>)
#import <yc_singular/yc_singular-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "yc_singular-Swift.h"
#endif

@implementation YcSingularPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftYcSingularPlugin registerWithRegistrar:registrar];
}
@end
