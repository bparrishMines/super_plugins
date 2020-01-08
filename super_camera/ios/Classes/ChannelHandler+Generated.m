// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************

#include <objc/message.h>
  
#import "ChannelHandler+Generated.h"

static void *wrapperCallbackKey = &wrapperCallbackKey;

@interface NotImplementedException : NSException
- (instancetype _Nonnull)initWithMethod:(NSString *)methodName;
@end

@interface NoUniqueIdException : NSException
- (instancetype _Nonnull)initWithMethod:(NSString *)methodName;
@end

@interface WrapperNotFoundException : NSException
- (instancetype _Nonnull)initWithUniqueId:(NSString *)uniqueId;
@end

@interface Wrapper ()
@property NSString *$uniqueId;
@property FlutterMethodChannel *callbackChannel;
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId;
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                           call:(FlutterMethodCall *_Nonnull)call;
- (NSObject *)onMethodCall:(WrapperManager *_Nonnull)wrapperManager
                      call:(FlutterMethodCall *_Nonnull)call;
+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call;
- (NSObject *)getValue;
- (void)$allocate:(WrapperManager *)wrapperManager;
- (void)$deallocate:(WrapperManager *)wrapperManager;
@end

@interface WrapperManager ()
@property NSMutableDictionary<NSString*, Wrapper*> *allocatedWrappers;
@property NSMutableDictionary<NSString*, Wrapper*> *temporaryWrappers;
- (void)addTemporaryWrapper:(Wrapper *)wrapper;
- (Wrapper *)getWrapper:(NSString *)uniqueId;
- (void)clearTemporaryWrappers;
@end

@interface ViewFactory : NSObject<FlutterPlatformViewFactory>
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                              methodCallHandler:(MethodCallHandler *_Nonnull)methodCallHandler
                                callbackChannel:(FlutterMethodChannel *_Nonnull)callbackChannel;
@property WrapperManager *_Nonnull wrapperManager;
@property MethodCallHandler *_Nonnull methodCallHandler;
@property FlutterMethodChannel *_Nonnull callbackChannel;
@end

@interface MethodCallHandler ()
@property WrapperManager *wrapperManager;
@property FlutterMethodChannel *_Nonnull callbackChannel;
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel;
@end

@implementation NotImplementedException 
- (instancetype _Nonnull)initWithMethod:(NSString *)methodName {
  return self = [super initWithName:@"NotImplementedException"
                             reason:[NSString stringWithFormat:@"No implementation for %@.", methodName]
                           userInfo:nil];
}
@end

@implementation NoUniqueIdException
- (instancetype _Nonnull)initWithMethod:(NSString *)methodName {
  return self = [super initWithName:@"NoUniqueIdException"
                             reason:[NSString stringWithFormat:@"MethodCall was made without a unique handle for %@.", methodName]
                           userInfo:nil];
}
@end

@implementation WrapperNotFoundException
- (instancetype _Nonnull)initWithUniqueId:(NSString *)uniqueId {
  return self = [super initWithName:@"WrapperNotFoundException"
                             reason:[NSString
                   stringWithFormat:@"Could not find Wrapper with uniqueId %@.", uniqueId]
                          userInfo:nil];
}
@end

@implementation Wrapper

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId {
  self = [super init];
  if (self) {
    _$uniqueId = uniqueId;
  }
  [wrapperManager addTemporaryWrapper:self];
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                           call:(FlutterMethodCall *_Nonnull)call {
  [self doesNotRecognizeSelector:_cmd];
  return nil;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                                call:(FlutterMethodCall *_Nonnull)call {
  [self doesNotRecognizeSelector:_cmd];
  return [NSNull null];
}

- (NSObject *)onMethodCall:(WrapperManager *_Nonnull)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  [self doesNotRecognizeSelector:_cmd];
  return [NSNull null];
}

- (NSObject *)getValue {
  [self doesNotRecognizeSelector:_cmd];
  return [NSNull null];
}

- (void)$allocate:(WrapperManager *)wrapperManager {
  [wrapperManager addAllocatedWrapper:self];
}

- (void)$deallocate:(WrapperManager *)wrapperManager {
  [wrapperManager removeAllocatedWrapper:_$uniqueId];
}

- (nonnull UIView *)view {
  return [self getValue];
}
@end

@implementation  NSValue (Structs)

+ (struct CGRect)getCGRect:(NSValue *)wrapperValue {
  struct CGRect value;
  [wrapperValue getValue:&value];
  return value;
}

@end




@implementation $NSError {
  
  NSError *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  NSError *
   _Nullable)value {
  self = [super initWithWrapperManager:wrapperManager uniqueId:uniqueId];
  if (self) {
    _value = value;
  }
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel
                                           call:(FlutterMethodCall *_Nonnull)call {
  self = [super initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$uniqueId"]];
  if (!self) return self;
  
  self.callbackChannel = callbackChannel;
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"NSError#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"NSError#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}







- (id)getValue {
  return _value;
}
@end



@implementation $AVCaptureDeviceInput {
  
  AVCaptureDeviceInput *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  AVCaptureDeviceInput *
   _Nullable)value {
  self = [super initWithWrapperManager:wrapperManager uniqueId:uniqueId];
  if (self) {
    _value = value;
  }
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel
                                           call:(FlutterMethodCall *_Nonnull)call {
  self = [super initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$uniqueId"]];
  if (!self) return self;
  
  self.callbackChannel = callbackChannel;
  
  if ([@"AVCaptureDeviceInput(initWithDevice)" isEqualToString:call.method]) {
    _value = [[AVCaptureDeviceInput alloc] initWithDevice
      
:![call.arguments[@"device"] isEqual:[NSNull null]] ? [[wrapperManager getWrapper:call.arguments[@"device"]] getValue] : nil
  
  error:nil
  
    ];  
  }
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"AVCaptureDeviceInput#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"AVCaptureDeviceInput#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}







- (id)getValue {
  return _value;
}
@end



@implementation $AVCaptureSession {
  
  AVCaptureSession *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  AVCaptureSession *
   _Nullable)value {
  self = [super initWithWrapperManager:wrapperManager uniqueId:uniqueId];
  if (self) {
    _value = value;
  }
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel
                                           call:(FlutterMethodCall *_Nonnull)call {
  self = [super initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$uniqueId"]];
  if (!self) return self;
  
  self.callbackChannel = callbackChannel;
  
  if ([@"AVCaptureSession()" isEqualToString:call.method]) {
    _value = [[AVCaptureSession alloc] init
      
    ];  
  }
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"AVCaptureSession#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"AVCaptureSession#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  else if ([@"AVCaptureSession#startRunning" isEqualToString:call.method]) {
    return [self startRunning:wrapperManager call:call];
  }
  
  else if ([@"AVCaptureSession#addInput" isEqualToString:call.method]) {
    return [self addInput:wrapperManager call:call];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}






- (NSObject *)startRunning:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  
  
  [_value startRunning
  
  ]
  
  
  ;
  return [NSNull null];
  
}

- (NSObject *)addInput:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  
  
  [_value addInput
  
:![call.arguments[@"input"] isEqual:[NSNull null]] ? [[wrapperManager getWrapper:call.arguments[@"input"]] getValue] : nil
  
  ]
  
  
  ;
  return [NSNull null];
  
}


- (id)getValue {
  return _value;
}
@end



@implementation $AVCaptureDevice {
  
  AVCaptureDevice *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  AVCaptureDevice *
   _Nullable)value {
  self = [super initWithWrapperManager:wrapperManager uniqueId:uniqueId];
  if (self) {
    _value = value;
  }
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel
                                           call:(FlutterMethodCall *_Nonnull)call {
  self = [super initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$uniqueId"]];
  if (!self) return self;
  
  self.callbackChannel = callbackChannel;
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  if ([@"AVCaptureDevice#devicesWithMediaType" isEqualToString:call.method]) {
    return [$AVCaptureDevice devicesWithMediaType:wrapperManager call:call];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"AVCaptureDevice#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"AVCaptureDevice#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  else if ([@"AVCaptureDevice.uniqueID" isEqualToString:call.method]) {
    return [self uniqueID:wrapperManager call:call];
  }
  
  else if ([@"AVCaptureDevice.position" isEqualToString:call.method]) {
    return [self position:wrapperManager call:call];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}




- (NSObject *)uniqueID:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  
  
  return
  

  _value.uniqueID

  
  ;
  
}

- (NSObject *)position:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  
  
  return @(
  

  _value.position

  
  );
  
}



+ (NSObject *)devicesWithMediaType:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  [[$NSArray alloc] initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$newUniqueId"] value:
  
  
  [AVCaptureDevice devicesWithMediaType
  
:call.arguments[@"mediaType"]
  
  ]
  
  
  ];
  return [NSNull null];
  
}


- (id)getValue {
  return _value;
}
@end



@implementation $NSArray {
  
  NSArray *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  NSArray *
   _Nullable)value {
  self = [super initWithWrapperManager:wrapperManager uniqueId:uniqueId];
  if (self) {
    _value = value;
  }
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel
                                           call:(FlutterMethodCall *_Nonnull)call {
  self = [super initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$uniqueId"]];
  if (!self) return self;
  
  self.callbackChannel = callbackChannel;
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"NSArray#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"NSArray#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  else if ([@"NSArray#objectAtIndex" isEqualToString:call.method]) {
    return [self objectAtIndex:wrapperManager call:call];
  }
  
  else if ([@"NSArray.count" isEqualToString:call.method]) {
    return [self count:wrapperManager call:call];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}




- (NSObject *)count:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  
  
  return @(
  

  _value.count

  
  );
  
}



- (NSObject *)objectAtIndex:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  NSObject *result =
  
  
  [_value objectAtIndex
  
:[call.arguments[@"index"] longValue]
  
  ]
  
  
  ;
  if (![call.arguments[@"$returnTypeIsWrapper"] boolValue]) return result;
  NSString *wrapperClassName = [NSString stringWithFormat:@"$%@", call.arguments[@"$returnTypePlatformName"]];
  Class wrapperClass = NSClassFromString(wrapperClassName);
  [[wrapperClass alloc] initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$newUniqueId"] value:result];
  return [NSNull null];
  
}


- (id)getValue {
  return _value;
}
@end



@implementation $CAMAutoresizeLayerView {
  
  CAMAutoresizeLayerView *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  CAMAutoresizeLayerView *
   _Nullable)value {
  self = [super initWithWrapperManager:wrapperManager uniqueId:uniqueId];
  if (self) {
    _value = value;
  }
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel
                                           call:(FlutterMethodCall *_Nonnull)call {
  self = [super initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$uniqueId"]];
  if (!self) return self;
  
  self.callbackChannel = callbackChannel;
  
  if ([@"CAMAutoresizeLayerView(initWithFrame)" isEqualToString:call.method]) {
    _value = [[CAMAutoresizeLayerView alloc] initWithFrame
      
:[NSValue getCGRect:[[wrapperManager getWrapper:call.arguments[@"frame"]] getValue]]
  
    ];  
  }
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"CAMAutoresizeLayerView#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"CAMAutoresizeLayerView#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  else if ([@"CAMAutoresizeLayerView.layer" isEqualToString:call.method]) {
    return [self layer:wrapperManager call:call];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}




- (NSObject *)layer:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  
  
  [[$CALayer alloc] initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$newUniqueId"] value:
  

  _value.layer

  
  ];
  return [NSNull null];
  
}




- (id)getValue {
  return _value;
}
@end



@implementation $AVCaptureVideoPreviewLayer {
  
  AVCaptureVideoPreviewLayer *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  AVCaptureVideoPreviewLayer *
   _Nullable)value {
  self = [super initWithWrapperManager:wrapperManager uniqueId:uniqueId];
  if (self) {
    _value = value;
  }
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel
                                           call:(FlutterMethodCall *_Nonnull)call {
  self = [super initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$uniqueId"]];
  if (!self) return self;
  
  self.callbackChannel = callbackChannel;
  
  if ([@"AVCaptureVideoPreviewLayer()" isEqualToString:call.method]) {
    _value = [[AVCaptureVideoPreviewLayer alloc] init
      
    ];  
  }
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"AVCaptureVideoPreviewLayer#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"AVCaptureVideoPreviewLayer#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  else if ([@"AVCaptureVideoPreviewLayer#addSublayer" isEqualToString:call.method]) {
    return [self addSublayer:wrapperManager call:call];
  }
  
  else if ([@"AVCaptureVideoPreviewLayer.session" isEqualToString:call.method]) {
    return [self session:wrapperManager call:call];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}




- (NSObject *)session:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  if (call.arguments[@"session"] != nil) {
    _value.session =
    
![call.arguments[@"session"] isEqual:[NSNull null]] ? [[wrapperManager getWrapper:call.arguments[@"session"]] getValue] : nil
  
    ;
  }
  
  
  [[$AVCaptureSession alloc] initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$newUniqueId"] value:
  

  _value.session

  
  ];
  return [NSNull null];
  
}



- (NSObject *)addSublayer:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  
  
  [_value addSublayer
  
:![call.arguments[@"layer"] isEqual:[NSNull null]] ? [[wrapperManager getWrapper:call.arguments[@"layer"]] getValue] : nil
  
  ]
  
  
  ;
  return [NSNull null];
  
}


- (id)getValue {
  return _value;
}
@end



@implementation $CALayer {
  
  CALayer *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  CALayer *
   _Nullable)value {
  self = [super initWithWrapperManager:wrapperManager uniqueId:uniqueId];
  if (self) {
    _value = value;
  }
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel
                                           call:(FlutterMethodCall *_Nonnull)call {
  self = [super initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$uniqueId"]];
  if (!self) return self;
  
  self.callbackChannel = callbackChannel;
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"CALayer#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"CALayer#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  else if ([@"CALayer#addSublayer" isEqualToString:call.method]) {
    return [self addSublayer:wrapperManager call:call];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}






- (NSObject *)addSublayer:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  
  
  [_value addSublayer
  
:![call.arguments[@"layer"] isEqual:[NSNull null]] ? [[wrapperManager getWrapper:call.arguments[@"layer"]] getValue] : nil
  
  ]
  
  
  ;
  return [NSNull null];
  
}


- (id)getValue {
  return _value;
}
@end



@implementation $CGRect {
  
  NSValue *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  NSValue *
   _Nullable)value {
  self = [super initWithWrapperManager:wrapperManager uniqueId:uniqueId];
  if (self) {
    _value = value;
  }
  return self;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel
                                           call:(FlutterMethodCall *_Nonnull)call {
  self = [super initWithWrapperManager:wrapperManager uniqueId:call.arguments[@"$uniqueId"]];
  if (!self) return self;
  
  self.callbackChannel = callbackChannel;
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"CGRect#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"CGRect#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}







- (id)getValue {
  return _value;
}
@end


@implementation ChannelHandler
- (instancetype _Nonnull)initWithCallbackChannel:(FlutterMethodChannel *_Nonnull)callbackChannel {
  self = [self init];
  if (self) {
    _wrapperManager = [[WrapperManager alloc] init];
    _methodCallHandler = [[MethodCallHandler alloc] initWithWrapperManager:_wrapperManager
                                                           callbackChannel:callbackChannel];
    _callbackChannel = callbackChannel;
    _viewFactory = [[ViewFactory alloc] initWithWrapperManager:_wrapperManager
                                             methodCallHandler:_methodCallHandler
                                               callbackChannel:_callbackChannel];
  }
  return self;
}
@end

@implementation WrapperManager
- (instancetype)init {
  self = [super init];
  if (self) {
    _allocatedWrappers = [NSMutableDictionary dictionary];
    _temporaryWrappers = [NSMutableDictionary dictionary];
  }
  return self;
}

- (void)addAllocatedWrapper:(Wrapper *)wrapper {
  [self addWrapper:wrapper wrapperDictionary:_allocatedWrappers];
}

- (void)removeAllocatedWrapper:(NSString *)uniqueId {
  [_allocatedWrappers removeObjectForKey:uniqueId];
}

- (void)addTemporaryWrapper:(Wrapper *)wrapper {
  [self addWrapper:wrapper wrapperDictionary:_temporaryWrappers];
}

- (void)addWrapper:(Wrapper *)wrapper wrapperDictionary:(NSMutableDictionary *)wrapperDictionary {
  Wrapper *existingWrapper;
  @try {
    existingWrapper = [self getWrapper:wrapper.$uniqueId];
  } @catch (WrapperNotFoundException *exception) {
    [wrapperDictionary setObject:wrapper forKey:wrapper.$uniqueId];
    return;
  }
  
  if ([existingWrapper getValue] != [wrapper getValue]) {
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"Object for uniqueId already exists: %@", wrapper.$uniqueId] userInfo:nil];
  }
  
  if ([wrapperDictionary objectForKey:wrapper.$uniqueId] == nil) {
    [wrapperDictionary setObject:wrapper forKey:wrapper.$uniqueId];
  }  
}

- (Wrapper *)getWrapper:(NSString *)uniqueId {
  if ([_allocatedWrappers objectForKey:uniqueId] != nil) return [_allocatedWrappers objectForKey:uniqueId];
  if ([_temporaryWrappers objectForKey:uniqueId] != nil) return [_temporaryWrappers objectForKey:uniqueId];
  @throw [[WrapperNotFoundException alloc] initWithUniqueId:uniqueId];
}

- (void)clearTemporaryWrappers {
  [_temporaryWrappers removeAllObjects];
}
@end

@implementation MethodCallHandler
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                callbackChannel:(FlutterMethodChannel *_Nullable)callbackChannel {
  self = [super init];
  if (self) {
    _wrapperManager = wrapperManager;
    _callbackChannel = callbackChannel;
  }
  return self;
}

- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
  @try {
    NSObject *object = [self onMethodCall:call];
    result(object);
  } @catch(NSException *exception) {
    result([FlutterError errorWithCode:exception.name message:exception.reason details:[NSThread callStackSymbols]]);
  } @finally {
    [_wrapperManager clearTemporaryWrappers];
  }
}

- (NSObject *)onMethodCall:(FlutterMethodCall *)call {
  NSLog(@"%@", call.method);
  if ([@"MultiInvoke" isEqualToString:call.method]) {
    NSArray<NSDictionary*> *allMethodCalls = call.arguments;
    NSMutableArray<NSObject *> *resultData = [NSMutableArray array];
    for (NSDictionary *methodCallData in allMethodCalls) {
      NSString *method = methodCallData[@"method"];
      NSDictionary *arguments = methodCallData[@"arguments"];
      
      FlutterMethodCall *methodCall = [FlutterMethodCall
         methodCallWithMethodName:method
                        arguments:arguments];
                        
      [resultData addObject:[self onMethodCall:methodCall]];
    }
    
    return resultData;
  }
  
  else if ([@"AVCaptureDeviceInput(initWithDevice)" isEqualToString:call.method]) {
    [[$AVCaptureDeviceInput alloc] initWithWrapperManager:_wrapperManager callbackChannel:_callbackChannel call:call];
    return [NSNull null];
  }
  
  else if ([@"AVCaptureSession()" isEqualToString:call.method]) {
    [[$AVCaptureSession alloc] initWithWrapperManager:_wrapperManager callbackChannel:_callbackChannel call:call];
    return [NSNull null];
  }
  
  else if ([@"CAMAutoresizeLayerView(initWithFrame)" isEqualToString:call.method]) {
    [[$CAMAutoresizeLayerView alloc] initWithWrapperManager:_wrapperManager callbackChannel:_callbackChannel call:call];
    return [NSNull null];
  }
  
  else if ([@"AVCaptureVideoPreviewLayer()" isEqualToString:call.method]) {
    [[$AVCaptureVideoPreviewLayer alloc] initWithWrapperManager:_wrapperManager callbackChannel:_callbackChannel call:call];
    return [NSNull null];
  }
  
  else if ([@"AVCaptureDevice#devicesWithMediaType" isEqualToString:call.method]) {
    return [$AVCaptureDevice onStaticMethodCall:_wrapperManager call:call];
  }
  
  
  NSString *uniqueId = call.arguments[@"$uniqueId"];
  if (uniqueId == nil) {
    @throw [[NoUniqueIdException alloc] initWithMethod:call.method];
  }

  return [[_wrapperManager getWrapper:uniqueId] onMethodCall:_wrapperManager call:call];
}
@end

@interface PlatformViewFrame : NSObject<FlutterPlatformView>
@property UIView *frame;
@end

@implementation PlatformViewFrame
- (nonnull UIView *)view {
  return _frame;
}
@end

@implementation ViewFactory
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                              methodCallHandler:(MethodCallHandler *_Nonnull)methodCallHandler
                                callbackChannel:(FlutterMethodChannel *_Nonnull)callbackChannel {
  self = [self init];
  if (self) {
    _wrapperManager = wrapperManager;
    _methodCallHandler = methodCallHandler;
    _callbackChannel = callbackChannel;
  }
  
  return self;
}

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame
                                            viewIdentifier:(int64_t)viewId
                                                 arguments:(id _Nullable)args {
  __block NSString *uniqueId = args;
  __block PlatformViewFrame *viewFrame = [[PlatformViewFrame alloc] init];
  viewFrame.frame = [[UIView alloc] initWithFrame:frame];
  
  NSValue *rectValue = [NSValue valueWithBytes:&frame objCType:@encode(CGRect)];
  __block $CGRect *cgRectWrapper = [[$CGRect alloc] initWithWrapperManager:_wrapperManager
                                                                  uniqueId:[[NSUUID UUID] UUIDString]
                                                                     value:rectValue];
  
  NSDictionary *callbackArguments = @{@"cgRect": cgRectWrapper.$uniqueId, @"$uniqueId": args};
  
  [_callbackChannel invokeMethod:@"CreateView"
                       arguments:callbackArguments
                          result:^(id  _Nullable result) {
                            [self->_wrapperManager addTemporaryWrapper:cgRectWrapper];
                            @try {
                              FlutterMethodCall *methodCall = [FlutterMethodCall methodCallWithMethodName:@"MultiInvoke" arguments:result];
                              [self->_methodCallHandler onMethodCall:methodCall];
                              [viewFrame.frame addSubview:[[self->_wrapperManager getWrapper:uniqueId] getValue]];
                              [viewFrame.frame subviews][0].autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
                            } @finally {
                              [self->_wrapperManager clearTemporaryWrappers];
                            }
                          }];
  
  return viewFrame;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
  return [FlutterStandardMessageCodec sharedInstance];
}
@end
