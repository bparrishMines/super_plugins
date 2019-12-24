import 'package:penguin/penguin.dart';

//@Class(IosPlatform(
//  IosType('AVCaptureSession', import: '<AVFoundation/AVFoundation.h>'),
//))
class CaptureSession {}

//@Class(IosPlatform(
//  IosType('AVCaptureDevice', import: '<AVFoundation/AVFoundation.h>'),
//))
class CaptureDevice {
  @Field()
  static Array<CaptureDevice> devices;
}

//@Class(IosPlatform(IosType('NSArray')))
class Array<T> {
  Array();
}
