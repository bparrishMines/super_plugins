part of 'camerax.dart';

class $UseCase extends AndroidWrapper {
  $UseCase(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'UseCase',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $LensFacing extends AndroidWrapper {
  $LensFacing(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'LensFacing',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  static MethodCall $BACK({
    LensFacing BACK,
    String $newUniqueId,
  }) {
    return MethodCall(
      'LensFacing.BACK',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        if (BACK != null) 'BACK': (BACK as Wrapper)?.uniqueId,
      },
    );
  }

  static MethodCall $FRONT({
    LensFacing FRONT,
    String $newUniqueId,
  }) {
    return MethodCall(
      'LensFacing.FRONT',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        if (FRONT != null) 'FRONT': (FRONT as Wrapper)?.uniqueId,
      },
    );
  }
}

class $CameraInfoX extends AndroidWrapper {
  $CameraInfoX(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'CameraInfo',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
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
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
      },
    );
  }
}

class $CameraX extends AndroidWrapper {
  $CameraX(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'CameraX',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  static MethodCall $bindToLifecycle(
    LifecycleOwner owner,
    UseCase useCase, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'CameraX#bindToLifecycle',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'owner': (owner as Wrapper)?.uniqueId,
        'useCase': (useCase as Wrapper)?.uniqueId,
      },
    );
  }

  static MethodCall $getCameraInfo(
    LensFacing lensFacing, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'CameraX#getCameraInfo',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'lensFacing': (lensFacing as Wrapper)?.uniqueId,
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
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
      },
    );
  }
}

class $LifecycleOwner extends AndroidWrapper {
  $LifecycleOwner(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'LifecycleOwner',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $Preview extends AndroidWrapper {
  $Preview(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'Preview',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $Preview$Default(
    PreviewConfig previewConfig,
  ) {
    return MethodCall(
      'Preview()',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        'previewConfig': (previewConfig as Wrapper)?.uniqueId,
      },
    );
  }

  MethodCall $setOnPreviewOutputUpdateListener(
    OnPreviewOutputUpdateListener listener, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'Preview#setOnPreviewOutputUpdateListener',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'listener': (listener as Wrapper)?.uniqueId,
      },
    );
  }
}

class $OnPreviewOutputUpdateListener extends AndroidWrapper {
  $OnPreviewOutputUpdateListener(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'OnPreviewOutputUpdateListener',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'OnPreviewOutputUpdateListener#onUpdated':
        (this as OnPreviewOutputUpdateListener).onUpdated(
          await PreviewOutput.onAllocated(
              $PreviewOutput(call.arguments['previewOutput'])),
        );
        break;
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $OnPreviewOutputUpdateListener$Default() {
    return MethodCall(
      'OnPreviewOutputUpdateListener()',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  MethodCall $onUpdated(
    PreviewOutput previewOutput, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'OnPreviewOutputUpdateListener#onUpdated',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'previewOutput': (previewOutput as Wrapper)?.uniqueId,
      },
    );
  }
}

class $PreviewOutput extends AndroidWrapper {
  $PreviewOutput(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'PreviewOutput',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
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
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
      },
    );
  }
}

class $PreviewConfig extends AndroidWrapper {
  $PreviewConfig(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'PreviewConfig',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $PreviewConfigBuilder extends AndroidWrapper {
  $PreviewConfigBuilder(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'PreviewConfigBuilder',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $PreviewConfigBuilder$Default() {
    return MethodCall(
      'PreviewConfigBuilder()',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  MethodCall $setLensFacing(
    LensFacing lensFacing, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'PreviewConfigBuilder#setLensFacing',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'lensFacing': (lensFacing as Wrapper)?.uniqueId,
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
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
      },
    );
  }
}

class $_TextureViewState extends AndroidWrapper {
  $_TextureViewState(
    String uniqueId, {
    List<MethodCall> Function(Context context) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'TextureView',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $_TextureViewStateforCodeGen(
    Context context,
  ) {
    return MethodCall(
      'TextureView(forCodeGen)',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        'context': (context as Wrapper)?.uniqueId,
      },
    );
  }

  MethodCall $setSurfaceTexture(
    SurfaceTexture surfaceTexture, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'TextureView#setSurfaceTexture',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'surfaceTexture': (surfaceTexture as Wrapper)?.uniqueId,
      },
    );
  }
}

class _GenericHelper {
  _GenericHelper._();

  static Wrapper getWrapperForType<T>(String uniqueId) {
    assert(isTypeOf<T, Wrapper>());

    if (isTypeOf<T, UseCase>()) {
      return $UseCase(uniqueId);
    } else if (isTypeOf<T, LensFacing>()) {
      return $LensFacing(uniqueId);
    } else if (isTypeOf<T, CameraInfoX>()) {
      return $CameraInfoX(uniqueId);
    } else if (isTypeOf<T, CameraX>()) {
      return $CameraX(uniqueId);
    } else if (isTypeOf<T, LifecycleOwner>()) {
      return $LifecycleOwner(uniqueId);
    } else if (isTypeOf<T, Preview>()) {
      return $Preview(uniqueId);
    } else if (isTypeOf<T, OnPreviewOutputUpdateListener>()) {
      return $OnPreviewOutputUpdateListener(uniqueId);
    } else if (isTypeOf<T, PreviewOutput>()) {
      return $PreviewOutput(uniqueId);
    } else if (isTypeOf<T, PreviewConfig>()) {
      return $PreviewConfig(uniqueId);
    } else if (isTypeOf<T, PreviewConfigBuilder>()) {
      return $PreviewConfigBuilder(uniqueId);
    } else if (isTypeOf<T, _TextureViewState>()) {
      return $_TextureViewState(uniqueId);
    } else if (isTypeOf<T, Context>()) {
      return $Context(uniqueId);
    } else if (isTypeOf<T, SurfaceTexture>()) {
      return $SurfaceTexture(uniqueId);
    }

    throw UnsupportedError('Could not instantiate class ${T.toString()}');
  }

  static FutureOr<dynamic> onAllocated(Wrapper wrapper) {
    if (wrapper is $UseCase) {
      return UseCase.onAllocated(wrapper as $UseCase);
    } else if (wrapper is $LensFacing) {
      return LensFacing.onAllocated(wrapper as $LensFacing);
    } else if (wrapper is $CameraInfoX) {
      return CameraInfoX.onAllocated(wrapper as $CameraInfoX);
    } else if (wrapper is $CameraX) {
      return CameraX.onAllocated(wrapper as $CameraX);
    } else if (wrapper is $LifecycleOwner) {
      return LifecycleOwner.onAllocated(wrapper as $LifecycleOwner);
    } else if (wrapper is $Preview) {
      return Preview.onAllocated(wrapper as $Preview);
    } else if (wrapper is $OnPreviewOutputUpdateListener) {
      return OnPreviewOutputUpdateListener.onAllocated(
          wrapper as $OnPreviewOutputUpdateListener);
    } else if (wrapper is $PreviewOutput) {
      return PreviewOutput.onAllocated(wrapper as $PreviewOutput);
    } else if (wrapper is $PreviewConfig) {
      return PreviewConfig.onAllocated(wrapper as $PreviewConfig);
    } else if (wrapper is $PreviewConfigBuilder) {
      return PreviewConfigBuilder.onAllocated(wrapper as $PreviewConfigBuilder);
    } else if (wrapper is $_TextureViewState) {
      return _TextureViewState.onAllocated(wrapper as $_TextureViewState);
    } else if (wrapper is $Context) {
      return Context.onAllocated(wrapper as $Context);
    } else if (wrapper is $SurfaceTexture) {
      return SurfaceTexture.onAllocated(wrapper as $SurfaceTexture);
    }

    throw UnsupportedError(
        'Could not instantiate class ${wrapper.runtimeType}');
  }
}
