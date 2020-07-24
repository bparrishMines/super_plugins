#import "SCFoundation.h"

NSString *const BASE_CHANNEL_NAME = @"bparrishMines.superplugins/super_camera/foundation";

@interface SCRemoteHandler : REFMethodChannelRemoteHandler
@end

@interface SCLocalHandler : NSObject<REFLocalReferenceCommunicationHandler>
@end

@implementation SCCaptureDevice
- (instancetype)initWithUniqueID:(NSString *)uniqueID position:(NSNumber *)position {
  self = [super init];
  if (self) {
    _uniqueID = uniqueID;
    _position = position;
    
    _device = [AVCaptureDevice deviceWithUniqueID:uniqueID];
  }
  return self;
}

- (nonnull REFClass *)referenceClass {
  return [REFClass fromClass:SCCaptureDevice.class];
}
@end

@implementation SCFoundation
+ (SCFoundation *)sharedInstance {
  static SCFoundation *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[SCFoundation alloc] init];
  });
  return sharedInstance;
}

- (NSArray<SCCaptureDevice *> *)devicesWithMediaType:(NSString *)mediaType {
  NSArray<AVCaptureDevice *> *devices = [AVCaptureDevice devicesWithMediaType:mediaType];
  NSMutableArray<SCCaptureDevice *> *deviceReferences = [NSMutableArray arrayWithCapacity:devices.count];
  
  for (AVCaptureDevice *device in devices) {
    [deviceReferences addObject:[[SCCaptureDevice alloc]
                                 initWithUniqueID:device.uniqueID position:@(device.position)]];
  }
  
  return deviceReferences;
}

- (nonnull REFClass *)referenceClass {
  return [REFClass fromClass:SCFoundation.class];
}
@end

@implementation SCCaptureDeviceInput
- (instancetype)initWithDevice:(SCCaptureDevice *)device {
  self = [super init];
  if (self) {
    _device = device;
    
    NSError *error;
    _input = [[AVCaptureDeviceInput alloc] initWithDevice:device.device error:&error];
    if (error) {
      @throw [NSException exceptionWithName:error.domain reason:error.localizedDescription userInfo:nil];
    }
  }
  return self;
}

- (nonnull REFClass *)referenceClass {
  return [REFClass fromClass:SCCaptureDeviceInput.class];
}
@end

@implementation SCCaptureSession
- (instancetype)initWithDeviceInputs:(NSArray<SCCaptureDeviceInput *> *)inputs {
  self = [super init];
  if (self) {
    _inputs = inputs;
    _session = [[AVCaptureSession alloc] init];
    
    for (SCCaptureDeviceInput *input in inputs) {
      [_session addInput:input.input];
    }
  }
  return self;
}

- (void)startRunning {
  [_session startRunning];
}

- (void)stopRunning{
  [_session stopRunning];
}

- (nonnull REFClass *)referenceClass {
  return [REFClass fromClass:SCCaptureSession.class];
}
@end

@implementation SCPreview
-(instancetype)initWithSession:(SCCaptureSession *)session {
  self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
  if (self) {
    _session = session;
    AVCaptureVideoPreviewLayer *layer = [[AVCaptureVideoPreviewLayer alloc]
                                         initWithSession:session.session];
    [self.layer addSublayer:layer];
  }
  return self;
}

- (void)layoutSubviews {
  self.layer.frame = self.bounds;
  NSArray<CALayer *> *sublayers = self.layer.sublayers;
  if (sublayers) {
    for (CALayer *layer in sublayers) layer.frame = self.bounds;
  }
}

- (nonnull REFClass *)referenceClass {
  return [REFClass fromClass:SCPreview.class];
}

- (UIView *)view {
  return self;
}
@end

@implementation SCRemoteHandler
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger {
  return self = [super initWithChannelName:BASE_CHANNEL_NAME binaryMessenger:binaryMessenger];
}

- (NSArray<id> *)getCreationArguments:(id<REFLocalReference>)localReference {
  if (localReference.referenceClass.clazz == SCCaptureDevice.class) {
    SCCaptureDevice *value = localReference;
    return @[value.uniqueID, value.position];
  }
  
  @throw [NSException exceptionWithName:NSInvalidArgumentException
                                 reason:[localReference description]
                               userInfo:nil];
}
@end

@implementation SCLocalHandler
- (nonnull id<REFLocalReference>)create:(nonnull REFReferencePairManager *)referencePairManager
                         referenceClass:(nonnull Class)referenceClass
                              arguments:(nonnull NSArray<id> *)arguments {
  if (referenceClass == SCFoundation.class) {
    return [SCFoundation sharedInstance];
  } else if (referenceClass == SCCaptureDeviceInput.class) {
    return [[SCCaptureDeviceInput alloc] initWithDevice:arguments[0]];
  } else if (referenceClass == SCCaptureSession.class) {
    return [[SCCaptureSession alloc] initWithDeviceInputs:arguments[0]];
  } else if (referenceClass == SCCaptureDevice.class) {
    return [[SCCaptureDevice alloc] initWithUniqueID:arguments[0] position:arguments[1]];
  } else if (referenceClass == SCPreview.class) {
    return [[SCPreview alloc] initWithSession:arguments[0]];
  }
  
  @throw [NSException exceptionWithName:NSInvalidArgumentException
                                 reason:NSStringFromClass(referenceClass)
                               userInfo:nil];
}

- (id _Nullable)invokeMethod:(nonnull REFReferencePairManager *)referencePairManager
              localReference:(nonnull id<REFLocalReference>)localReference
                  methodName:(nonnull NSString *)methodName
                   arguments:(nonnull NSArray<id> *)arguments {
  if (localReference.referenceClass.clazz == SCCaptureSession.class) {
    SCCaptureSession *value = localReference;
    if ([methodName isEqualToString:@"startRunning"]) {
      [value startRunning];
      return nil;
    } else if ([methodName isEqualToString:@"stopRunning"]) {
      [value stopRunning];
      return nil;
    }
  } else if (localReference.referenceClass.clazz == SCFoundation.class) {
    SCFoundation *value = localReference;
    if ([methodName isEqualToString:@"devicesWithMediaType"]) {
      return [value devicesWithMediaType:arguments[0]];
    }
  }

  @throw [NSException exceptionWithName:NSInvalidArgumentException
                                 reason:@[localReference, methodName].description
                               userInfo:nil];
}
@end

@implementation SCReferencePairManager
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger {
  return self = [super initWithSupportedClasses:@[
    [REFClass fromClass:SCFoundation.class],
    [REFClass fromClass:SCCaptureDeviceInput.class],
    [REFClass fromClass:SCCaptureSession.class],
    [REFClass fromClass:SCCaptureDevice.class],
    [REFClass fromClass:SCPreview.class],
  ]
                                binaryMessenger:binaryMessenger
                                    channelName:BASE_CHANNEL_NAME];
}

- (id<REFLocalReferenceCommunicationHandler>)localHandler {
  return [[SCLocalHandler alloc] init];
}

- (id<REFRemoteReferenceCommunicationHandler>)remoteHandler {
  return [[SCRemoteHandler alloc] init];
}
@end

@implementation SCPreivewViewFactory
- (instancetype)initWithManager:(SCReferencePairManager *)manager {
  self = [super init];
  if (self) {
    _manager = manager;
    _viewFactoryId = [NSString stringWithFormat:@"%@/Preview", BASE_CHANNEL_NAME];
  }
  return self;
}

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame
                                            viewIdentifier:(int64_t)viewId
                                                 arguments:(id _Nullable)args {
  SCPreview *preview = (SCPreview *) [_manager getPairedLocalReference:args];
  preview.frame = frame;
  return preview;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
  return [FlutterStandardMessageCodec codecWithReaderWriter:[[REFReferenceReaderWriter alloc] init]];
}
@end
