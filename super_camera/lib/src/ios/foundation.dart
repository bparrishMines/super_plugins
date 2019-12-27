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

  static const String video = 'vide';
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
    final $Array<CaptureDevice> array = $Array<CaptureDevice>(Common.uuid.v4());

    array.methodCallStorageHelper.storeAll([
      $CaptureDevice.$devicesWithMediaType(mediaType, array.uniqueId),
    ]);

    return Array.onAllocated<CaptureDevice>(array);
  }

  static FutureOr<CaptureDevice> onAllocated($CaptureDevice wrapper) async {
    final String uniqueID = await invoke<String>(Common.channel, [
      ...wrapper.methodCallStorageHelper.methodCalls,
      wrapper.$uniqueID(),
    ]);
    return CaptureDevice._(uniqueId: wrapper.uniqueId, uniqueID: uniqueID);
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
  T objectAtIndex(@int64 int index) => _wrappers[index];

  List<T> toList() => List<T>.of(_wrappers);

  static FutureOr<Array<S>> onAllocated<S>($Array array) async {
    if (isTypeOf<S, Wrapper>()) {
      final int count = await invoke<int>(Common.channel, [
        ...array.methodCallStorageHelper.methodCalls,
        array.$count(),
      ]);

      final List<S> wrappers = <S>[];

      for (int i = 0; i < count; i++) {
        final Wrapper newWrapper =
            _GenericHelper.getWrapperForType<S>(Common.uuid.v4());

        newWrapper.methodCallStorageHelper.storeAll([
          ...array.methodCallStorageHelper.methodCalls,
          array.$objectAtIndex(i, newWrapper.uniqueId),
        ]);

        wrappers.add(await _GenericHelper.onAllocated(newWrapper));
      }

      return Array<S>._(array.uniqueId, count, wrappers);
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
