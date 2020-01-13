// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************

part of 'camera.dart';

class $Camera extends Wrapper {
  $Camera.fromUniqueId(String uniqueId, {MethodChannel channel})
      : assert(uniqueId != null),
        super(channel, uniqueId);

  String get platformClassName => 'Camera';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  static MethodCall $getNumberOfCameras() => MethodCall(
        'Camera#getNumberOfCameras',
        <String, dynamic>{
          r'$returnTypeIsWrapper': isTypeOf<int, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<int, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<int>()
              : null,
        },
      );

  static MethodCall $open(
    int cameraId,
  ) =>
      MethodCall(
        'Camera#open',
        <String, dynamic>{
          r'$returnTypeIsWrapper': isTypeOf<Camera, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<Camera, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<Camera>()
              : null,
          r'cameraId': _setParameter(cameraId),
          r'cameraId$isWrapper': cameraId != null && cameraId is Wrapper,
        },
      );

  static MethodCall $getCameraInfo(
    int cameraId,
    CameraInfo cameraInfo,
  ) =>
      MethodCall(
        'Camera#getCameraInfo',
        <String, dynamic>{
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
          r'cameraId': _setParameter(cameraId),
          r'cameraId$isWrapper': cameraId != null && cameraId is Wrapper,
          r'cameraInfo': _setParameter(cameraInfo),
          r'cameraInfo$isWrapper': cameraInfo != null && cameraInfo is Wrapper,
        },
      );

  MethodCall $release() => MethodCall(
        'Camera#release',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
        },
      );

  MethodCall $startPreview() => MethodCall(
        'Camera#startPreview',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
        },
      );

  MethodCall $stopPreview() => MethodCall(
        'Camera#stopPreview',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
        },
      );

  MethodCall $setPreviewTexture(
    SurfaceTexture surfaceTexture,
  ) =>
      MethodCall(
        'Camera#setPreviewTexture',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
          r'surfaceTexture': _setParameter(surfaceTexture),
          r'surfaceTexture$isWrapper':
              surfaceTexture != null && surfaceTexture is Wrapper,
        },
      );
}

class $CameraInfo extends Wrapper {
  $CameraInfo.fromUniqueId(String uniqueId, {MethodChannel channel})
      : assert(uniqueId != null),
        super(channel, uniqueId);

  $CameraInfo.$Default({MethodChannel channel}) : super(channel) {
    channel.invokeMethod<void>(
      'CameraCameraInfo()',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  String get platformClassName => 'CameraCameraInfo';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $get$facing() => MethodCall(
        'CameraCameraInfo.facing',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
        },
      );

  MethodCall $set$facing(
    int facing,
  ) =>
      MethodCall(
        'CameraCameraInfo.facing',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'facing': _setParameter(facing),
          r'facing$isWrapper': facing != null && facing is Wrapper,
        },
      );

  MethodCall $get$orientation() => MethodCall(
        'CameraCameraInfo.orientation',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
        },
      );

  MethodCall $set$orientation(
    int orientation,
  ) =>
      MethodCall(
        'CameraCameraInfo.orientation',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'orientation': _setParameter(orientation),
          r'orientation$isWrapper':
              orientation != null && orientation is Wrapper,
        },
      );
}

class _GenericHelper extends GenericHelper {
  const _GenericHelper._();

  static final _GenericHelper instance = _GenericHelper._();

  String getPlatformClassForType<T>() {
    if (isTypeOf<T, Camera>()) {
      return 'Camera';
    } else if (isTypeOf<T, CameraInfo>()) {
      return 'CameraCameraInfo';
    } else if (isTypeOf<T, SurfaceTexture>()) {
      return 'SurfaceTexture';
    }

    throw UnsupportedError(
        'Could not find platform class name for ${T.toString()}');
  }

  T getWrapperForType<T>(String uniqueId) {
    assert(isTypeOf<T, Wrapper>());

    if (isTypeOf<T, Camera>()) {
      return Camera.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, CameraInfo>()) {
      return CameraInfo.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, SurfaceTexture>()) {
      return SurfaceTexture.fromUniqueId(uniqueId) as T;
    }

    throw UnsupportedError('Could not instantiate class ${T.toString()}');
  }
}

dynamic _setParameter(dynamic parameter) {
  if (parameter == null) return null;
  if (parameter is Wrapper) return (parameter as Wrapper).uniqueId;
  return parameter;
}
