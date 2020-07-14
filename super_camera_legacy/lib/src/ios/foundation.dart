import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:penguin_plugin/penguin_plugin.dart';
import 'package:super_camera/src/common/channel.dart';

part 'foundation.ios.penguin.g.dart';

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
class NSError extends $NSError {
  NSError.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);
}

@Class(IosPlatform(
  IosType('AVCaptureDeviceInput', import: '<AVFoundation/AVFoundation.h>'),
))
class CaptureDeviceInput extends $CaptureDeviceInput {
  @Constructor()
  CaptureDeviceInput.initWithDevice(CaptureDevice device, [NSError error])
      : super.initWithDevice(device, error, channel: Common.channel);

  CaptureDeviceInput.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);
}

@Class(IosPlatform(
  IosType('AVCaptureSession', import: '<AVFoundation/AVFoundation.h>'),
))
class CaptureSession extends $CaptureSession {
  @Constructor()
  CaptureSession() : super.$Default(channel: Common.channel);

  CaptureSession.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  @Method()
  Future<void> startRunning() =>
      invoke<void>(Common.channel, [$startRunning()]);

  @Method()
  Future<void> addInput(CaptureDeviceInput input) =>
      invoke<void>(Common.channel, [$addInput(input)]);

  @Method()
  Future<void> stopRunning() => invoke<void>(Common.channel, [$stopRunning()]);
}

@Class(IosPlatform(
  IosType('AVCaptureDevice', import: '<AVFoundation/AVFoundation.h>'),
))
class CaptureDevice extends $CaptureDevice {
  CaptureDevice.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  @Field()
  Future<String> get uniqueID =>
      invoke<String>(Common.channel, [$get$uniqueID()]);

  @Field()
  @int64
  Future<int> get position => invoke<int>(Common.channel, [$get$position()]);

  @Method()
  static Future<Array<CaptureDevice>> devicesWithMediaType(String mediaType) {
    final Completer<Array<CaptureDevice>> completer =
        Completer<Array<CaptureDevice>>();

    invoke<Array>(
      Common.channel,
      [$CaptureDevice.$devicesWithMediaType(mediaType)],
      genericHelper: _GenericHelper.instance,
    ).then(
      (Array array) => completer.complete(array.cast<CaptureDevice>()),
    );

    return completer.future;
  }

  @Method()
  static Future<CaptureDevice> deviceWithUniqueID(String deviceUniqueId) =>
      invoke<CaptureDevice>(
        Common.channel,
        [$CaptureDevice.$deviceWithUniqueID(deviceUniqueId)],
        genericHelper: _GenericHelper.instance,
      );
}

@Class(IosPlatform(IosType('NSArray')))
class Array<T> extends $Array<T> {
  Array.fromUniqueId(String uniqueId, {bool addToManager = true})
      : super.fromUniqueId(
          uniqueId,
          channel: Common.channel,
          addToManager: addToManager,
        );

  @Field()
  @int64
  Future<int> get count => invoke<int>(Common.channel, [$get$count()]);

  @Method()
  Future<T> objectAtIndex(@int64 int index) =>
      invoke<T>(Common.channel, [$objectAtIndex(index)],
          genericHelper: _GenericHelper.instance);

  Array<T> cast<T>() {
    return Array<T>.fromUniqueId(uniqueId, addToManager: false);
  }
}

class ViewWidget extends StatefulWidget {
  ViewWidget(this.previewLayer) {
    previewLayer.retain();
  }

  final CaptureVideoPreviewLayer previewLayer;

  @override
  State<StatefulWidget> createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {
  final String callbackId = Common.uuid.v4();
  View view;

  @override
  void dispose() {
    super.dispose();
    widget.previewLayer.release();
    view.release();
  }

  @override
  void initState() {
    super.initState();
    PenguinPlugin.addIosViewCreatorCallback(callbackId, onCreateView);
  }

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: '${Common.channel.name}/views',
      creationParams: callbackId,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  Future<String> onCreateView(CGRect frame) async {
    view = View.initWithFrame(frame);
    final Layer layer = await view.layer;
    layer.addSublayer(widget.previewLayer);
    return Future<String>.value(view.autoReleasePool().uniqueId);
  }
}

@Class(IosPlatform(
    IosType('CAMAutoresizeLayerView', import: '"SuperCameraPlugin.h"')))
class View extends $View {
  @Constructor()
  View.initWithFrame(CGRect frame)
      : super.initWithFrame(frame, channel: Common.channel);

  View.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  @Field()
  Future<Layer> get layer => invoke<Layer>(Common.channel, [$get$layer()],
      genericHelper: _GenericHelper.instance);
}

@Class(IosPlatform(IosType('AVCaptureVideoPreviewLayer',
    import: '<AVFoundation/AVFoundation.h>')))
class CaptureVideoPreviewLayer extends $CaptureVideoPreviewLayer
    implements Layer {
  @Constructor()
  CaptureVideoPreviewLayer() : super.$Default(channel: Common.channel);

  CaptureVideoPreviewLayer.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  @Field()
  set session(CaptureSession session) => invoke<void>(
        Common.channel,
        [$set$session(session)],
        genericHelper: _GenericHelper.instance,
      );

  @override
  Future<void> addSublayer(Layer layer) =>
      invoke<void>(Common.channel, [$addSublayer(layer)]);
}

@Class(IosPlatform(IosType('CALayer')))
class Layer extends $Layer {
  Layer.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  @Method()
  Future<void> addSublayer(Layer layer) =>
      invoke<void>(Common.channel, [$addSublayer(layer)]);
}
