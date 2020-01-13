// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************

part of 'texture_registry.dart';

class $SurfaceTextureEntry extends Wrapper {
  $SurfaceTextureEntry.fromUniqueId(String uniqueId, {MethodChannel channel})
      : assert(uniqueId != null),
        super(channel, uniqueId);

  String get platformClassName => 'SurfaceTextureEntry';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $id() => MethodCall(
        'SurfaceTextureEntry#id',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<int, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<int, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<int>()
              : null,
        },
      );

  MethodCall $surfaceTexture() => MethodCall(
        'SurfaceTextureEntry#surfaceTexture',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<SurfaceTexture, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<SurfaceTexture, Wrapper>()
              ? _GenericHelper.instance
                  .getPlatformClassForType<SurfaceTexture>()
              : null,
        },
      );

  MethodCall $release() => MethodCall(
        'SurfaceTextureEntry#release',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
        },
      );
}

class $SurfaceTexture extends Wrapper {
  $SurfaceTexture.fromUniqueId(String uniqueId, {MethodChannel channel})
      : assert(uniqueId != null),
        super(channel, uniqueId);

  String get platformClassName => 'SurfaceTexture';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $TextureRegistry extends Wrapper {
  $TextureRegistry.fromUniqueId(String uniqueId, {MethodChannel channel})
      : assert(uniqueId != null),
        super(channel, uniqueId);

  String get platformClassName => 'TextureRegistry';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $createSurfaceTexture() => MethodCall(
        'TextureRegistry#createSurfaceTexture',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<SurfaceTextureEntry, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<SurfaceTextureEntry, Wrapper>()
              ? _GenericHelper.instance
                  .getPlatformClassForType<SurfaceTextureEntry>()
              : null,
        },
      );
}

class _GenericHelper extends GenericHelper {
  const _GenericHelper._();

  static final _GenericHelper instance = _GenericHelper._();

  String getPlatformClassForType<T>() {
    if (isTypeOf<T, SurfaceTextureEntry>()) {
      return 'SurfaceTextureEntry';
    } else if (isTypeOf<T, SurfaceTexture>()) {
      return 'SurfaceTexture';
    } else if (isTypeOf<T, TextureRegistry>()) {
      return 'TextureRegistry';
    }

    throw UnsupportedError(
        'Could not find platform class name for ${T.toString()}');
  }

  T getWrapperForType<T>(String uniqueId) {
    assert(isTypeOf<T, Wrapper>());

    if (isTypeOf<T, SurfaceTextureEntry>()) {
      return SurfaceTextureEntry.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, SurfaceTexture>()) {
      return SurfaceTexture.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, TextureRegistry>()) {
      return TextureRegistry.fromUniqueId(uniqueId) as T;
    }

    throw UnsupportedError('Could not instantiate class ${T.toString()}');
  }
}

dynamic _setParameter(dynamic parameter) {
  if (parameter == null) return null;
  if (parameter is Wrapper) return (parameter as Wrapper).uniqueId;
  return parameter;
}
