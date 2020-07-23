#import "SuperCameraPlugin.h"

@implementation SuperCameraPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  SCReferencePairManager *manager = [[SCReferencePairManager alloc] initWithBinaryMessenger:registrar.messenger];
  [manager initialize];
  
  SCPreivewViewFactory *factory = [[SCPreivewViewFactory alloc] initWithManager:manager];
  [registrar registerViewFactory:factory withId:factory.viewFactoryId];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  // Do nothing
}
@end
