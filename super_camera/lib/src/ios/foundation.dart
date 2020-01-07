import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:penguin_plugin/penguin_plugin.dart';
import 'package:penguin_plugin/ios_wrapper.dart';
import 'package:super_camera/src/common/channel.dart';
import 'package:super_camera/src/interface/camera_interface.dart';

part 'foundation.ios.penguin.g.dart';

final CallbackHandler _callbackHandler = IosCallbackHandler();

class MediaType {
  MediaType._();

  static const String video = 'vide';
}

class CaptureDevicePosition {
  CaptureDevicePosition._();

  static const int back = 1;

  static const int front = 2;
}

@Class(IosPlatform(IosType('NSError')))
class NSError {
  NSError._();

  static FutureOr onAllocated($NSError wrapper) => throw UnimplementedError();
}

@Class(IosPlatform(
  IosType('AVCaptureDeviceInput', import: '<AVFoundation/AVFoundation.h>'),
))
class CaptureDeviceInput extends $CaptureDeviceInput {
  @Constructor()
  CaptureDeviceInput.initWithDevice(CaptureDevice device, [NSError error])
      : super(Common.uuid.v4()) {
    assert(error == null);
    methodCallStorageHelper.storeAll([
      ...device.methodCallStorageHelper.methodCalls,
      device.allocate(),
      $CaptureDeviceInputinitWithDevice(device, null),
    ]);
  }

  static FutureOr onAllocated($CaptureDeviceInput wrapper) =>
      throw UnimplementedError();
}

@Class(IosPlatform(
  IosType('AVCaptureSession', import: '<AVFoundation/AVFoundation.h>'),
))
class CaptureSession extends $CaptureSession {
  @Constructor()
  CaptureSession() : super(Common.uuid.v4()) {
    methodCallStorageHelper.storeAll([$CaptureSession$Default()]);
  }

  bool _isAllocated = false;

  @Method()
  Future<void> startRunning() {
    final Completer<void> completer = Completer<void>();

    invoke<void>(Common.channel, [
//      if (!_isAllocated) ...methodCallStorageHelper.methodCalls,
//      if (!_isAllocated) allocate(),
      $startRunning(),
    ]).then((_) => completer.complete());

    //_isAllocated = true;

    return completer.future;
  }

  @Method()
  void addInput(CaptureDeviceInput input) {
    methodCallStorageHelper.storeAll([
      ...input.methodCallStorageHelper.methodCalls,
      input.allocate(),
      $addInput(input),
    ]);
  }

  static FutureOr onAllocated($CaptureSession wrapper) =>
      throw UnimplementedError();
}

@Class(IosPlatform(
  IosType('AVCaptureDevice', import: '<AVFoundation/AVFoundation.h>'),
))
class CaptureDevice extends $CaptureDevice implements CameraDescription {
  CaptureDevice._({
    @required String uniqueId,
    this.uniqueID,
    this.position,
  }) : super(uniqueId);

  @Field()
  final String uniqueID;

  @Field()
  @int64
  final int position;

  @Method()
  static Future<Array<CaptureDevice>> devicesWithMediaType(String mediaType) {
    final $Array<CaptureDevice> array = $Array<CaptureDevice>(Common.uuid.v4());

    array.methodCallStorageHelper.storeAll([
      $CaptureDevice.$devicesWithMediaType(mediaType, array.uniqueId),
    ]);

    return Array.onAllocated<CaptureDevice>(array);
  }

  static FutureOr<CaptureDevice> onAllocated($CaptureDevice wrapper) async {
    final List<dynamic> results = await invokeForAll(Common.channel, [
      ...wrapper.methodCallStorageHelper.methodCalls,
      wrapper.$uniqueID(),
      wrapper.$position(),
    ]);

    final CaptureDevice device = CaptureDevice._(
      uniqueId: wrapper.uniqueId,
      uniqueID: results[results.length - 2],
      position: results[results.length - 1],
    );

    device.methodCallStorageHelper
        .storeAll(wrapper.methodCallStorageHelper.methodCalls);
    return device;
  }

  @override
  LensDirection get direction {
    switch (position) {
      case CaptureDevicePosition.front:
        return LensDirection.front;
      case CaptureDevicePosition.back:
        return LensDirection.back;
    }

    throw UnsupportedError('Position of value $position is not supported.');
  }

  @override
  String get name => uniqueID;
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

      final Array<S> resultArray = Array<S>._(array.uniqueId, count, wrappers);
      resultArray.methodCallStorageHelper
          .storeAll(array.methodCallStorageHelper.methodCalls);
      return resultArray;
    }

    throw UnimplementedError();
  }
}

class View extends StatefulWidget {
  View({this.sublayers = const <Layer>[], this.onViewCreated}) {
    Common.callbackHandler = _callbackHandler;
  }

  final List<Layer> sublayers;
  final Function onViewCreated;

  @override
  State<StatefulWidget> createState() => _ViewState();
}

@Class(IosPlatform(IosType('UIView')))
class _ViewState extends State<View> {
  _ViewState();

  @Constructor()
  _ViewState.initWithFrame(CGRect rect);

  bool created = false;

  $_ViewState view;

  @Field()
  Layer get layer {
    final Layer layer = Layer._(Common.uuid.v4());
    layer.methodCallStorageHelper.store(view.$layer(
      $newUniqueId: layer.uniqueId,
    ));
    return layer;
  }

  @override
  void dispose() {
    super.dispose();
    invoke<void>(Common.channel, [view.deallocate()]);
    _callbackHandler.removeWrapper(view);
  }

  @override
  void initState() {
    super.initState();
    view = $_ViewState(Common.uuid.v4(), onCreateView: (CGRect cgRect) {
      created = true;

      final Iterable<MethodCall> sublayerCalls = widget.sublayers
          .expand<MethodCall>(
              (Layer layer) => layer.methodCallStorageHelper.methodCalls);

      final Layer viewLayer = layer;

      if (widget.onViewCreated != null)
        Future<void>.delayed(Duration(seconds: 1), () {
          widget.onViewCreated();
        });

      return <MethodCall>[
        view.$_ViewStateinitWithFrame(cgRect),
        view.allocate(),
        ...sublayerCalls,
        ...viewLayer.methodCallStorageHelper.methodCalls,
        for (Layer layer in widget.sublayers) viewLayer.$addSublayer(layer),
      ];
    });
    _callbackHandler.addWrapper(view);
  }

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: '${Common.channel.name}/views',
      creationParams: view.uniqueId,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  static FutureOr onAllocated($_ViewState wrapper) =>
      throw UnimplementedError();
}

@Class(IosPlatform(IosType('AVCaptureVideoPreviewLayer',
    import: '<AVFoundation/AVFoundation.h>')))
class CaptureVideoPreviewLayer extends $CaptureVideoPreviewLayer
    implements Layer {
  @Constructor()
  CaptureVideoPreviewLayer() : super(Common.uuid.v4()) {
    methodCallStorageHelper.storeAll([$CaptureVideoPreviewLayer$Default(), allocate()]);
  }

  @Field()
  set session(CaptureSession session) {
    methodCallStorageHelper.replaceAll([
      if (!session._isAllocated) ...session.methodCallStorageHelper.methodCalls,
      if (!session._isAllocated) session.allocate(),
      $session(session: session),
    ]);
  }

  @override
  void addSublayer(Layer layer) {
    methodCallStorageHelper.replaceAll([
      ...layer.methodCallStorageHelper.methodCalls,
      $addSublayer(layer),
    ]);
  }

  static FutureOr onAllocated($CaptureVideoPreviewLayer wrapper) =>
      throw UnimplementedError();
}

@Class(IosPlatform(IosType('CALayer')))
class Layer extends $Layer {
  Layer._(String uniqueId) : super(uniqueId);

  @Method()
  void addSublayer(Layer layer) {
    methodCallStorageHelper.replaceAll([
      ...layer.methodCallStorageHelper.methodCalls,
      $addSublayer(layer),
    ]);
  }

  static FutureOr onAllocated($Layer wrapper) => throw UnimplementedError();
}
