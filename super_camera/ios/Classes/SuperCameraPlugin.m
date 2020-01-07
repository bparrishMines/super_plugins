#import "SuperCameraPlugin.h"
#import "ChannelHandler+Generated.h"

@interface SuperCameraPlugin ()
@property ChannelHandler *handler;
@end

@implementation SuperCameraPlugin
- (instancetype)initWithCallbackChannel:(FlutterMethodChannel *)callbackChannel {
  self = [self init];
  if (self) {
    _handler = [[ChannelHandler alloc] initWithCallbackChannel:callbackChannel];
  }
  return self;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"super_plugins/super_camera"
            binaryMessenger:[registrar messenger]];
  SuperCameraPlugin* instance = [[SuperCameraPlugin alloc] initWithCallbackChannel:channel];
  [registrar addMethodCallDelegate:instance channel:channel];
  [registrar registerViewFactory:instance.handler.viewFactory withId:@"super_plugins/super_camera/views"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  [_handler.methodCallHandler onMethodCall:call result:result];
}

@end
