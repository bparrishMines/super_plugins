part of 'texture_registry.dart';

class $SurfaceTextureEntry extends AndroidWrapper {
  $SurfaceTextureEntry(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'SurfaceTextureEntry',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
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
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
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
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
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
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
      },
    );
  }
}

class $SurfaceTexture extends AndroidWrapper {
  $SurfaceTexture(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'SurfaceTexture',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $TextureRegistry extends AndroidWrapper {
  $TextureRegistry(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'TextureRegistry',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
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
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
      },
    );
  }
}

class _GenericHelper {
  _GenericHelper._();

  static Wrapper getWrapperForType<T>(String uniqueId) {
    assert(isTypeOf<T, Wrapper>());

    if (isTypeOf<T, SurfaceTextureEntry>()) {
      return $SurfaceTextureEntry(uniqueId);
    } else if (isTypeOf<T, SurfaceTexture>()) {
      return $SurfaceTexture(uniqueId);
    } else if (isTypeOf<T, TextureRegistry>()) {
      return $TextureRegistry(uniqueId);
    }

    throw UnsupportedError('Could not instantiate class ${T.toString()}');
  }

  static FutureOr<dynamic> onAllocated(Wrapper wrapper) {
    if (wrapper is $SurfaceTextureEntry) {
      return SurfaceTextureEntry.onAllocated(wrapper as $SurfaceTextureEntry);
    } else if (wrapper is $SurfaceTexture) {
      return SurfaceTexture.onAllocated(wrapper as $SurfaceTexture);
    } else if (wrapper is $TextureRegistry) {
      return TextureRegistry.onAllocated(wrapper as $TextureRegistry);
    }

    throw UnsupportedError(
        'Could not instantiate class ${wrapper.runtimeType}');
  }
}
