import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:penguin_plugin/penguin_plugin.dart';
import 'package:penguin_plugin/ios_wrapper.dart';
import 'package:super_camera/src/common/channel.dart';

part 'foundation.ios.penguin.g.dart';

class MediaType {
  MediaType._();

  static const String video = 'AVMediaTypeVideo';
}

@Class(IosPlatform(
  IosType('AVCaptureSession', import: '<AVFoundation/AVFoundation.h>'),
))
class CaptureSession extends $CaptureSession {
  CaptureSession._() : super(Common.uuid.v4());

  static FutureOr onAllocated($CaptureSession wrapper) =>
      throw UnimplementedError();
}

@Class(IosPlatform(
  IosType('AVCaptureDevice', import: '<AVFoundation/AVFoundation.h>'),
))
class CaptureDevice extends $CaptureDevice {
  CaptureDevice._({
    @required String uniqueId,
    this.uniqueID,
  }) : super(uniqueId);

  @Field()
  final String uniqueID;

  @Method()
  static Future<Array<CaptureDevice>> devicesWithMediaType(String mediaType) {
    final $Array array = $Array(Common.uuid.v4());

    invokeForAll(Common.channel, [
      $CaptureDevice.$devicesWithMediaType(mediaType, array.uniqueId),
      array.allocate(),
    ]);

    return Array.onAllocated<CaptureDevice>(array);
  }

  static FutureOr<CaptureDevice> onAllocated($CaptureDevice wrapper) async {
    return CaptureDevice._(uniqueId: wrapper.uniqueId, uniqueID: 'er');
  }
}

@Class(IosPlatform(IosType('NSArray')))
class Array<T> extends $Array<T> {
  Array._(String uniqueId, this.count, this._wrappers) : super(uniqueId);

  @Field()
  @int64
  final int count;

  final List<T> _wrappers;

  @Method()
  T objectAtIndex(@int64 index) => _wrappers[index];

  static FutureOr<Array<S>> onAllocated<S>($Array wrapper) async {
    if (isTypeOf<S, Wrapper>()) {
      final int count = await invoke<int>(Common.channel, [wrapper.$count()]);
      final List<S> wrappers = <S>[];

      for (int i = 0; i < count; i++) {
        final Wrapper newWrapper =
            _GenericHelper.getWrapperForType<S>(Common.uuid.v4());
        invoke<void>(
          Common.channel,
          [
            wrapper.$objectAtIndex(i, newWrapper.uniqueId),
            newWrapper.allocate()
          ],
        );

        wrappers.add(await _GenericHelper.onAllocated(newWrapper));
      }

      return Array._(wrapper.uniqueId, count, wrappers);
    }

    throw UnimplementedError();
  }
}

@Class(IosPlatform(IosType('UIView')))
class View {
  @Constructor()
  View.initWithFrame(CGRect rect);

  static FutureOr onAllocated($View wrapper) => throw UnimplementedError();
}
