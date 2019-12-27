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
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
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
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}




- (NSObject *)uniqueID:(WrapperManager *)wrapperManager call:(FlutterMethodCall *)call {
  
  
  
  return
  

  _value.uniqueID

  
  ;
  
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



@implementation $UIView {
  
  UIView *
  
  _value;
}

- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                       uniqueId:(NSString *_Nonnull)uniqueId
                                          value:(
  UIView *
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
  
  if ([@"UIView(initWithFrame)" isEqualToString:call.method]) {
    _value = [[UIView alloc] initWithFrame
      
:[NSValue getCGRect:[[wrapperManager getWrapper:call.arguments[@"rect"]] getValue]]
  
    ];  
  }
  
  
  
  
  return self;
}

+ (NSObject *)onStaticMethodCall:(WrapperManager *_Nonnull)wrapperManager
                            call:(FlutterMethodCall *_Nonnull)call {
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
}

- (NSObject *)onMethodCall:(WrapperManager *)wrapperManager call:(FlutterMethodCall *_Nonnull)call {
  if ([@"UIView#allocate" isEqualToString:call.method]) {
    [self $allocate:wrapperManager];
    return [NSNull null];
  } else if ([@"UIView#deallocate" isEqualToString:call.method]) {
    [self $deallocate:wrapperManager];
    return [NSNull null];
  }
  
  
  @throw [[NotImplementedException alloc] initWithMethod:call.method];
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
  
  else if ([@"UIView(initWithFrame)" isEqualToString:call.method]) {
    [[$UIView alloc] initWithWrapperManager:_wrapperManager callbackChannel:_callbackChannel call:call];
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
                              [[viewFrame.frame subviews][0] sizeToFit];
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
