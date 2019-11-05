// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************
import 'dart:async';

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

  MethodCall $CameraInfo$Default() {
    return MethodCall(
      'CameraInfo()',
      <String, String>{
        r'$uniqueId': $uniqueId,
      },
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

class $SurfaceTexture extends $Wrapper {
  $SurfaceTexture(String $uniqueId) : super($uniqueId);

  @override
  String get $platformClassName => 'SurfaceTexture';
}

class $TextureRegistry extends $Wrapper {
  $TextureRegistry(String $uniqueId) : super($uniqueId);

  MethodCall $createSurfaceTexture([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'TextureRegistry#createSurfaceTexture',
      <String, dynamic>{
        r'$uniqueId': $uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  @override
  String get $platformClassName => 'TextureRegistry';
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

Future<T> $invoke<T>(
  MethodChannel channel,
  MethodCall call, [
  Iterable<MethodCall> following = const <MethodCall>[],
]) {
  final Completer<T> completer = Completer<T>();

  $invokeAll(
    channel,
    <MethodCall>[call, ...following].where((MethodCall call) => call != null),
  ).then(
    (List<dynamic> results) => completer.complete(results.last),
  );

  return completer.future;
}

Future<List<T>> $invokeList<T>(
  MethodChannel channel,
  MethodCall call, [
  Iterable<MethodCall> following = const <MethodCall>[],
]) {
  final Completer<List<T>> completer = Completer<List<T>>();

  $invokeAll(
    channel,
    <MethodCall>[call, ...following].where((MethodCall call) => call != null),
  ).then(
    (List<dynamic> results) => completer.complete(results.last.cast<T>()),
  );

  return completer.future;
}

Future<Map<S, T>> $invokeMap<S, T>(
  MethodChannel channel,
  MethodCall call, [
  Iterable<MethodCall> following = const <MethodCall>[],
]) {
  final Completer<Map<S, T>> completer = Completer<Map<S, T>>();

  $invokeAll(
    channel,
    <MethodCall>[call, ...following].where((MethodCall call) => call != null),
  ).then(
    (List<dynamic> results) => completer.complete(results.last.cast<S, T>()),
  );

  return completer.future;
}

Future<List<dynamic>> $invokeAll(
  MethodChannel channel,
  Iterable<MethodCall> methodCalls,
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
