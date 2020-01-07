// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************
#import <Flutter/Flutter.h>

#import <AVFoundation/AVFoundation.h>

@interface Wrapper : NSObject<FlutterPlatformView>
@end

@interface WrapperManager : NSObject
- (void)addAllocatedWrapper:(Wrapper *_Nonnull)wrapper;
- (void)removeAllocatedWrapper:(NSString *_Nonnull)uniqueId;
@end

@interface MethodCallHandler : NSObject
- (void)onMethodCall:(FlutterMethodCall *_Nonnull)call result:(FlutterResult _Nonnull)result;
@end

@interface ChannelHandler : NSObject
- (instancetype _Nonnull)initWithCallbackChannel:(FlutterMethodChannel *_Nonnull)callbackChannel;
@property WrapperManager *_Nonnull wrapperManager;
@property MethodCallHandler *_Nonnull methodCallHandler;
@property id<FlutterPlatformViewFactory> _Nonnull viewFactory;
@property FlutterMethodChannel *_Nonnull callbackChannel;
@end


@interface $NSError : Wrapper
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                uniqueId:(NSString *_Nonnull)uniqueId
                                value:(
                                
                                NSError *
                                
                                _Nullable)value;
@end

@interface $AVCaptureDeviceInput : Wrapper
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                uniqueId:(NSString *_Nonnull)uniqueId
                                value:(
                                
                                AVCaptureDeviceInput *
                                
                                _Nullable)value;
@end

@interface $AVCaptureSession : Wrapper
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                uniqueId:(NSString *_Nonnull)uniqueId
                                value:(
                                
                                AVCaptureSession *
                                
                                _Nullable)value;
@end

@interface $AVCaptureDevice : Wrapper
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                uniqueId:(NSString *_Nonnull)uniqueId
                                value:(
                                
                                AVCaptureDevice *
                                
                                _Nullable)value;
@end

@interface $NSArray : Wrapper
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                uniqueId:(NSString *_Nonnull)uniqueId
                                value:(
                                
                                NSArray *
                                
                                _Nullable)value;
@end

@interface $UIView : Wrapper
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                uniqueId:(NSString *_Nonnull)uniqueId
                                value:(
                                
                                UIView *
                                
                                _Nullable)value;
@end

@interface $AVCaptureVideoPreviewLayer : Wrapper
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                uniqueId:(NSString *_Nonnull)uniqueId
                                value:(
                                
                                AVCaptureVideoPreviewLayer *
                                
                                _Nullable)value;
@end

@interface $CALayer : Wrapper
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                uniqueId:(NSString *_Nonnull)uniqueId
                                value:(
                                
                                CALayer *
                                
                                _Nullable)value;
@end

@interface $CGRect : Wrapper
- (instancetype _Nonnull)initWithWrapperManager:(WrapperManager *_Nonnull)wrapperManager
                                uniqueId:(NSString *_Nonnull)uniqueId
                                value:(
                                
                                NSValue *
                                
                                _Nullable)value;
@end

