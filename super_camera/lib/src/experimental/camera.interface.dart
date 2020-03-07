import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'camera.android.dart';

mixin MethodChannelReferenceHolder {
  MethodChannel get channel;

  int _refCount = 0;

  String _referenceId = Random().nextDouble().toString();

  String get referenceId => _referenceId;

  void retain() {
    _refCount++;

    if (_refCount == 1) {
      channel.invokeMethod<void>('CREATE', this);
    }
  }

  void release() {
    _refCount--;

    if (_refCount == 0) {
      channel.invokeMethod<void>('DESTROY', this);
    } else if (_refCount < 0) {
      _refCount = 0;
    }
  }

  void autoReleasePool() {
    WidgetsBinding.instance.addPostFrameCallback((_) => release());
  }

  void changeReferenceId(String referenceId) => _referenceId = referenceId;
}

class Interface {
  const Interface({this.androidImpl, this.iosImpl});

  final AndroidType androidImpl;
  final IosType iosImpl;
}

// Java on multiple platforms. Need to do it per platform.
class AndroidType {
  const AndroidType({this.package, this.name});

  final String package;
  final String name;
}

class IosType {
  const IosType(this.name, {this.import});

  final String import;
  final String name;
}

class DartType {
  const DartType({this.import});

  final String import;
}

@Interface()
class LensDirection {
  const LensDirection(this.value);

  final String value;

  static const LensDirection front = LensDirection('front');
  static const LensDirection back = LensDirection('back');
  static const LensDirection unknown = LensDirection('unknown');
}

@Interface()
class CameraDescription {
  CameraDescription(this.direction, this.name);

  static final CameraDescription back = CameraDescription(LensDirection.back, '0');
  static final CameraDescription front = CameraDescription(LensDirection.front, '1');

  final LensDirection direction;

  final String name;
}

class UseMethodChannel {
  const UseMethodChannel();
}

@Interface()
class CameraConfigurator {
  CameraConfigurator._(this.cameraDescription);

  factory CameraConfigurator(CameraDescription description) {
    return CameraPlatform.creator.createCameraConfigurator(
      CameraConfigurator._(description),
    );
  }

  final CameraDescription cameraDescription;

  Future<Widget> getPreviewWidget() {
    throw UnimplementedError();
  }

  Future<void> initialize() {
    throw UnimplementedError();
  }

  Future<void> start() {
    throw UnimplementedError();
  }

  Future<void> stop() {
    throw UnimplementedError();
  }

  Future<void> dispose() {
    throw UnimplementedError();
  }
}

class CameraPlatform {
  static CameraInstanceCreator creator = AndroidInstanceCreator();
  static MethodChannel channel = MethodChannel(
    'super_plugins/super_camera',
    StandardMethodCodec(CameraMessageCodec()),
  );
}

abstract class CameraInstanceCreator {
  CameraConfigurator createCameraConfigurator(CameraConfigurator configurator);
}

class CameraMessageCodec extends StandardMessageCodec {
  const CameraMessageCodec();

  static const int _valueLensDirection = 128;
  static const int _valueCameraDescription = 129;
  static const int _valueCameraConfigurator = 130;

  @override
  void writeValue(WriteBuffer buffer, dynamic value) {
    if (value is LensDirection) {
      buffer.putUint8(_valueLensDirection);
      writeValue(buffer, value.value);
    } else if (value is CameraDescription) {
      buffer.putUint8(_valueCameraDescription);
      writeValue(buffer, value.direction);
      writeValue(buffer, value.name);
    } else if (value is CameraConfigurator) {
      buffer.putUint8(_valueCameraConfigurator);
      writeValue(buffer, value.cameraDescription);
      writeValue(buffer, (value as MethodChannelReferenceHolder).referenceId);
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  dynamic readValueOfType(int type, ReadBuffer buffer) {
    dynamic readNextValue() => readValueOfType(buffer.getUint8(), buffer);

    switch (type) {
      case _valueLensDirection:
        return LensDirection(readNextValue());
      case _valueCameraDescription:
        return CameraDescription(readNextValue(), readNextValue());
      case _valueCameraConfigurator:
        return (CameraConfigurator(readNextValue())
            as MethodChannelReferenceHolder)
          ..changeReferenceId(readNextValue());
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}
