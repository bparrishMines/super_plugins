#import <Flutter/Flutter.h>
#import <AVFoundation/AVFoundation.h>
@import reference;

NS_ASSUME_NONNULL_BEGIN

extern NSString *const BASE_CHANNEL_NAME;

@interface SCCaptureDevice : NSObject<REFLocalReference>
@property (readonly) NSString *uniqueID;
@property (readonly) NSNumber *position;
@property (readonly) AVCaptureDevice *device;
- (instancetype)initWithUniqueID:(NSString *)uniqueID position:(NSNumber *)position;
@end

@interface SCCaptureDeviceInput : NSObject<REFLocalReference>
@property (readonly) SCCaptureDevice *device;
@property (readonly) AVCaptureDeviceInput *input;
- (instancetype)initWithDevice:(SCCaptureDevice *)device;
@end

@interface SCFoundation : NSObject<REFLocalReference>
+ (SCFoundation *)sharedInstance;
- (NSArray<SCCaptureDevice *> *)devicesWithMediaType:(NSString *)mediaType;
@end

@interface SCCaptureSession : NSObject<REFLocalReference>
@property (readonly) NSArray<SCCaptureDeviceInput *> *inputs;
@property (readonly) AVCaptureSession *session;
- (instancetype)initWithDeviceInputs:(NSArray<SCCaptureDeviceInput *> *)inputs;
- (void)startRunning;
- (void)stopRunning;
@end

@interface SCPreview : UIView<FlutterPlatformView, REFLocalReference>
@property (readonly) SCCaptureSession *session;
-(instancetype)initWithSession:(SCCaptureSession *)session;
@end

@interface SCReferencePairManager : REFMethodChannelReferencePairManager
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
@end

@interface SCPreivewViewFactory : NSObject<FlutterPlatformViewFactory>
@property (readonly) SCReferencePairManager *manager;
@property (readonly) NSString *viewFactoryId;
- (instancetype)initWithManager:(SCReferencePairManager *)manager;
@end

NS_ASSUME_NONNULL_END
