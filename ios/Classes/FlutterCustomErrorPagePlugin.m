#import "FlutterCustomErrorPagePlugin.h"
#import <flutter_custom_error_page/flutter_custom_error_page-Swift.h>

@implementation FlutterCustomErrorPagePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterCustomErrorPagePlugin registerWithRegistrar:registrar];
}
@end
