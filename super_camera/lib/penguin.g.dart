// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************
import 'package:flutter/services.dart';

class $Camera extends $Wrapper {
  $Camera(String $uniqueId) : super($uniqueId);

  static MethodCall $getNumberOfCameras([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Camera#getNumberOfCameras',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  static MethodCall $open(
    int cameraId, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Camera#open',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        'cameraId': cameraId,
      },
    );
  }

  static MethodCall $getCameraInfo(
    int cameraId,
    $CameraInfo cameraInfo, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Camera#getCameraInfo',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        'cameraId': cameraId,
        'cameraInfo': cameraInfo?.$uniqueId,
      },
    );
  }

  MethodCall $release([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Camera#release',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  MethodCall $startPreview([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Camera#startPreview',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  MethodCall $stopPreview([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Camera#stopPreview',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  MethodCall $setPreviewTexture(
    $SurfaceTexture surfaceTexture, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Camera#setPreviewTexture',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
        'surfaceTexture': surfaceTexture?.$uniqueId,
      },
    );
  }

  @override
  String get $platformClassName => 'Camera';
}

class $CameraInfo extends $Wrapper {
  $CameraInfo(String $uniqueId) : super($uniqueId);

  MethodCall $CameraInfoDefault() {
    return MethodCall(
      'CameraInfo()',
      <String, String>{r'$uniqueId': $uniqueId},
    );
  }

  MethodCall $facing({
    int facing,
    String $newUniqueId,
  }) {
    return MethodCall(
      'CameraInfo.facing',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
        'facing': facing,
      },
    );
  }

  MethodCall $orientation({
    int orientation,
    String $newUniqueId,
  }) {
    return MethodCall(
      'CameraInfo.orientation',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
        'orientation': orientation,
      },
    );
  }

  @override
  String get $platformClassName => 'CameraInfo';
}

class $SurfaceTexture extends $Wrapper {
  $SurfaceTexture(String $uniqueId) : super($uniqueId);

  @override
  String get $platformClassName => 'SurfaceTexture';
}

class $SuperCameraPlugin extends $Wrapper {
  $SuperCameraPlugin(String $uniqueId) : super($uniqueId);

  static MethodCall $getSurfaceTextureEntry([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'SuperCameraPlugin#getSurfaceTextureEntry',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  @override
  String get $platformClassName => 'SuperCameraPlugin';
}

class $SurfaceTextureEntry extends $Wrapper {
  $SurfaceTextureEntry(String $uniqueId) : super($uniqueId);

  MethodCall $id([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'SurfaceTextureEntry#id',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  MethodCall $release([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'SurfaceTextureEntry#release',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  MethodCall $surfaceTexture([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'SurfaceTextureEntry#surfaceTexture',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  @override
  String get $platformClassName => 'SurfaceTextureEntry';
}

abstract class $Wrapper {
  $Wrapper(this.$uniqueId);

  final String $uniqueId;

  String get $platformClassName;

  MethodCall $allocate() {
    return MethodCall(
      '${$platformClassName}#allocate',
      <String, String>{r'$uniqueId': $uniqueId},
    );
  }

  MethodCall $deallocate() {
    return MethodCall(
      '${$platformClassName}#deallocate',
      <String, String>{r'$uniqueId': $uniqueId},
    );
  }
}

Future<T> $invoke<T>(MethodChannel channel, MethodCall call) {
  return channel.invokeMethod<T>(call.method, call.arguments);
}

Future<List<T>> $invokeList<T>(MethodChannel channel, MethodCall call) {
  return channel.invokeListMethod<T>(call.method, call.arguments);
}

Future<Map<S, T>> $invokeMap<S, T>(MethodChannel channel, MethodCall call) {
  return channel.invokeMapMethod<S, T>(call.method, call.arguments);
}

Future<List<dynamic>> $invokeAll(
  MethodChannel channel,
  List<MethodCall> methodCalls,
) {
  final List<Map<String, dynamic>> serializedCalls = methodCalls
      .map<Map<String, dynamic>>(
        (MethodCall methodCall) => <String, dynamic>{
          'method': methodCall.method,
          'arguments': methodCall.arguments,
        },
      )
      .toList();

  return channel.invokeListMethod<dynamic>('MultiInvoke', serializedCalls);
}

bool _isTypeOf<ThisType, OfType>() =>
    _Instance<ThisType>() is _Instance<OfType>;

class _Instance<T> {}
