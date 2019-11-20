// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************
import 'dart:async';

import 'package:flutter/services.dart';

class $Camera extends Wrapper {
  const $Camera(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'Camera';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

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
        'cameraInfo': cameraInfo?.uniqueId,
      },
    );
  }

  MethodCall $release([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Camera#release',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
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
        r'$uniqueId': uniqueId,
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
        r'$uniqueId': uniqueId,
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
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        'surfaceTexture': surfaceTexture?.uniqueId,
      },
    );
  }
}

class $CameraInfo extends Wrapper {
  const $CameraInfo(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'CameraCameraInfo';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $CameraInfo$Default() {
    return MethodCall(
      'CameraCameraInfo()',
      <String, String>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  MethodCall $facing({
    int facing,
    String $newUniqueId,
  }) {
    return MethodCall(
      'CameraCameraInfo.facing',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
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
      'CameraCameraInfo.orientation',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        'orientation': orientation,
      },
    );
  }
}

class $Activity extends Wrapper {
  const $Activity(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'Activity';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $SurfaceTextureEntry extends Wrapper {
  const $SurfaceTextureEntry(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'SurfaceTextureEntry';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $id([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'SurfaceTextureEntry#id',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
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
        r'$uniqueId': uniqueId,
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
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }
}

class $SurfaceTexture extends Wrapper {
  const $SurfaceTexture(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'SurfaceTexture';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $TextureRegistry extends Wrapper {
  const $TextureRegistry(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'TextureRegistry';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $createSurfaceTexture([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'TextureRegistry#createSurfaceTexture',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }
}

class $UseCase extends Wrapper {
  const $UseCase(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'UseCase';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $LensFacing extends Wrapper {
  const $LensFacing(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'LensFacing';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  static MethodCall $BACK({
    $LensFacing BACK,
    String $newUniqueId,
  }) {
    return MethodCall(
      'LensFacing.BACK',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        'BACK': BACK?.uniqueId,
      },
    );
  }

  static MethodCall $FRONT({
    $LensFacing FRONT,
    String $newUniqueId,
  }) {
    return MethodCall(
      'LensFacing.FRONT',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        'FRONT': FRONT?.uniqueId,
      },
    );
  }
}

class $CameraInfoX extends Wrapper {
  const $CameraInfoX(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'CameraInfo';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $getSensorRotationDegrees([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'CameraInfo#getSensorRotationDegrees',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }
}

class $CameraX extends Wrapper {
  const $CameraX(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'CameraX';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  static MethodCall $bindToLifecycle(
    $LifecycleOwner owner,
    $UseCase useCase, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'CameraX#bindToLifecycle',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        'owner': owner?.uniqueId,
        'useCase': useCase?.uniqueId,
      },
    );
  }

  static MethodCall $getCameraInfo(
    $LensFacing lensFacing, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'CameraX#getCameraInfo',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        'lensFacing': lensFacing?.uniqueId,
      },
    );
  }

  static MethodCall $unbindAll([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'CameraX#unbindAll',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
      },
    );
  }
}

class $LifecycleOwner extends Wrapper {
  const $LifecycleOwner(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'LifecycleOwner';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $Preview extends Wrapper {
  const $Preview(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'Preview';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $Preview$Default(
    $PreviewConfig previewConfig,
  ) {
    return MethodCall(
      'Preview()',
      <String, String>{
        r'$uniqueId': uniqueId,
        'previewConfig': previewConfig?.uniqueId,
      },
    );
  }

  MethodCall $setOnPreviewOutputUpdateListener(
    $OnPreviewOutputUpdateListener listener, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Preview#setOnPreviewOutputUpdateListener',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        'listener': listener?.uniqueId,
      },
    );
  }
}

class $OnPreviewOutputUpdateListener extends Wrapper {
  const $OnPreviewOutputUpdateListener(
    String uniqueId, {
    this.$onUpdated$Callback,
  }) : super(uniqueId);

  final List<MethodCall> Function(
    $PreviewOutput previewOutput,
  ) $onUpdated$Callback;

  @override
  String get platformClassName => 'OnPreviewOutputUpdateListener';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
      case 'OnPreviewOutputUpdateListener#onUpdated':
        return $onUpdated$Callback(
          $PreviewOutput(call.arguments['previewOutput']),
        );
        break;
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $OnPreviewOutputUpdateListener$Default() {
    return MethodCall(
      'OnPreviewOutputUpdateListener()',
      <String, String>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  MethodCall $onUpdated(
    $PreviewOutput previewOutput, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'OnPreviewOutputUpdateListener#onUpdated',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        'previewOutput': previewOutput?.uniqueId,
      },
    );
  }
}

class $PreviewOutput extends Wrapper {
  const $PreviewOutput(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'PreviewOutput';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $getSurfaceTexture([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'PreviewOutput#getSurfaceTexture',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }
}

class $PreviewConfig extends Wrapper {
  const $PreviewConfig(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'PreviewConfig';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $PreviewConfigBuilder extends Wrapper {
  const $PreviewConfigBuilder(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'PreviewConfigBuilder';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $PreviewConfigBuilder$Default() {
    return MethodCall(
      'PreviewConfigBuilder()',
      <String, String>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  MethodCall $setLensFacing(
    $LensFacing lensFacing, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'PreviewConfigBuilder#setLensFacing',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        'lensFacing': lensFacing?.uniqueId,
      },
    );
  }

  MethodCall $build([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'PreviewConfigBuilder#build',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
      },
    );
  }
}

class $_TextureViewState extends Wrapper {
  const $_TextureViewState(
    String uniqueId,
  ) : super(uniqueId);

  @override
  String get platformClassName => 'TextureView';

  @override
  List<MethodCall> onMethodCall(MethodCall call) {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $_TextureViewState$Default(
    $Activity activity,
  ) {
    return MethodCall(
      'TextureView()',
      <String, String>{
        r'$uniqueId': uniqueId,
        'activity': activity?.uniqueId,
      },
    );
  }

  MethodCall $setSurfaceTexture(
    $SurfaceTexture surfaceTexture, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'TextureView#setSurfaceTexture',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        'surfaceTexture': surfaceTexture?.uniqueId,
      },
    );
  }
}

class CallbackHandler {
  CallbackHandler() {
    _methodCallHandler = (MethodCall call) async {
      final List<MethodCall> result =
          _wrappers[call.arguments[r'$uniqueId']].onMethodCall(call);
      if (result == null) return null;
      return result
          .map<Map<String, dynamic>>(
            (MethodCall methodCall) => <String, dynamic>{
              'method': methodCall.method,
              'arguments': methodCall.arguments,
            },
          )
          .toList();
    };
  }

  final Map<String, Wrapper> _wrappers = <String, Wrapper>{};
  Future<dynamic> Function(MethodCall call) _methodCallHandler;

  Future<dynamic> Function(MethodCall call) get methodCallHandler =>
      _methodCallHandler;

  void addWrapper(Wrapper wrapper) => _wrappers[wrapper.uniqueId] = wrapper;

  Wrapper removeWrapper(Wrapper wrapper) => _wrappers.remove(wrapper.uniqueId);

  void clearAll() => _wrappers.clear();
}

abstract class Wrapper {
  const Wrapper(this.uniqueId);

  final String uniqueId;

  String get platformClassName;
  List<MethodCall> onMethodCall(MethodCall call);

  MethodCall allocate() {
    return MethodCall(
      '$platformClassName#allocate',
      <String, String>{r'$uniqueId': uniqueId},
    );
  }

  MethodCall deallocate() {
    return MethodCall(
      '$platformClassName#deallocate',
      <String, String>{r'$uniqueId': uniqueId},
    );
  }
}

Future<T> invoke<T>(
  MethodChannel channel,
  MethodCall call, [
  Iterable<MethodCall> following = const <MethodCall>[],
]) {
  final Completer<T> completer = Completer<T>();

  invokeAll(
    channel,
    <MethodCall>[call, ...following].where((MethodCall call) => call != null),
  ).then(
    (List<dynamic> results) => completer.complete(results.last),
  );

  return completer.future;
}

Future<List<T>> invokeList<T>(
  MethodChannel channel,
  MethodCall call, [
  Iterable<MethodCall> following = const <MethodCall>[],
]) {
  final Completer<List<T>> completer = Completer<List<T>>();

  invokeAll(
    channel,
    <MethodCall>[call, ...following].where((MethodCall call) => call != null),
  ).then(
    (List<dynamic> results) => completer.complete(results.last.cast<T>()),
  );

  return completer.future;
}

Future<Map<S, T>> invokeMap<S, T>(
  MethodChannel channel,
  MethodCall call, [
  Iterable<MethodCall> following = const <MethodCall>[],
]) {
  final Completer<Map<S, T>> completer = Completer<Map<S, T>>();

  invokeAll(
    channel,
    <MethodCall>[call, ...following].where((MethodCall call) => call != null),
  ).then(
    (List<dynamic> results) => completer.complete(results.last.cast<S, T>()),
  );

  return completer.future;
}

Future<List<dynamic>> invokeAll(
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
