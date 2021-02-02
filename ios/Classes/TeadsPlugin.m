#import "TeadsPlugin.h"
#if __has_include(<teads/teads-Swift.h>)
#import <teads/teads-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "teads-Swift.h"
#endif

@implementation TeadsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTeadsPlugin registerWithRegistrar:registrar];
}
@end
