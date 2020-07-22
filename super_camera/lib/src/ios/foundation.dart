import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:reference/reference.dart';
import 'package:super_camera/src/ios/foundation_manager.dart';

FoundationManager _manager = FoundationManager()..initialize();

class Foundation implements LocalReference {
  Foundation._() {
    _manager.pairWithNewRemoteReference(this);
  }

  static final Foundation instance = Foundation._();

  static Future<List<CaptureDevice>> devicesWithMediaType(
      String mediaType) async {
    final List<Object> devices = await _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(instance),
      'devicesWithMediaType',
      <Object>[mediaType],
    );
    return devices.cast<CaptureDevice>();
  }

  @override
  Type get referenceType => Foundation;
}

class MediaType {
  MediaType._();

  static const String video = 'vide';
}

class CaptureDevicePosition {
  CaptureDevicePosition._();

  static const int back = 1;

  static const int front = 2;
}

// Data class
class CaptureDeviceInput implements LocalReference {
  CaptureDeviceInput(this.device);

  final CaptureDevice device;

  @override
  Type get referenceType => CaptureDeviceInput;
}

// Instance/Data Class
class CaptureSession implements LocalReference {
  CaptureSession(this.inputs);

  final List<CaptureDeviceInput> inputs;

  Future<void> startRunning() {
    if (_manager.getPairedRemoteReference(this) == null) {
      _manager.pairWithNewRemoteReference(this);
    }

    return _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'startRunning',
    );
  }

  Future<void> stopRunning() {
    _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'stopRunning',
    );
    return _manager.disposePairWithLocalReference(this);
  }

  @override
  Type get referenceType => CaptureSession;
}

// Data Class
class CaptureDevice implements LocalReference {
  CaptureDevice(this.uniqueId, this.position);

  final String uniqueId;
  final int position;

  @override
  Type get referenceType => CaptureDevice;
}

// Widget
class Preview extends StatefulWidget implements LocalReference {
  Preview(this.session);

  final CaptureSession session;

  @override
  State<StatefulWidget> createState() => _PreviewState();

  @override
  Type get referenceType => Preview;
}

class _PreviewState extends State<Preview> {
  @override
  void initState() {
    super.initState();
    if (_manager.getPairedRemoteReference(widget.session) == null) {
      _manager.pairWithNewRemoteReference(widget.session);
    }
    _manager.pairWithNewRemoteReference(widget);
  }

  @override
  void dispose() {
    super.dispose();
    _manager.disposePairWithLocalReference(widget);
  }

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: '${_manager.channel}/$Preview',
      creationParams: _manager.getPairedRemoteReference(widget),
      creationParamsCodec: ReferenceMessageCodec(),
    );
  }
}
