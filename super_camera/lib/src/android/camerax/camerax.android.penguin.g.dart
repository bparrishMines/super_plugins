//// GENERATED CODE - DO NOT MODIFY BY HAND
//
//// **************************************************************************
//// PenguinGenerator
//// **************************************************************************
//
//part of 'camerax.dart';
//
//class $UseCase extends Wrapper {
//  $UseCase.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  String get platformClassName => 'UseCase';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//}
//
//class $LensFacing extends Wrapper {
//  $LensFacing.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  String get platformClassName => 'LensFacing';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//
//  static MethodCall $get$BACK() => MethodCall(
//        'LensFacing.BACK',
//        <String, dynamic>{},
//      );
//
//  static MethodCall $set$BACK(
//    LensFacing BACK,
//  ) =>
//      MethodCall(
//        'LensFacing.BACK',
//        <String, dynamic>{
//          r'BACK': _setParameter(BACK),
//          r'BACK$isWrapper': BACK != null && BACK is Wrapper,
//        },
//      );
//
//  static MethodCall $get$FRONT() => MethodCall(
//        'LensFacing.FRONT',
//        <String, dynamic>{},
//      );
//
//  static MethodCall $set$FRONT(
//    LensFacing FRONT,
//  ) =>
//      MethodCall(
//        'LensFacing.FRONT',
//        <String, dynamic>{
//          r'FRONT': _setParameter(FRONT),
//          r'FRONT$isWrapper': FRONT != null && FRONT is Wrapper,
//        },
//      );
//}
//
//class $CameraInfoX extends Wrapper {
//  $CameraInfoX.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  String get platformClassName => 'CameraInfo';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//
//  MethodCall $getSensorRotationDegrees() => MethodCall(
//        'CameraInfo#getSensorRotationDegrees',
//        <String, dynamic>{
//          r'$uniqueId': uniqueId,
//          r'$returnTypeIsWrapper': isTypeOf<int, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<int, Wrapper>()
//              ? _GenericHelper.instance.getPlatformClassForType<int>()
//              : null,
//        },
//      );
//}
//
//class $CameraX extends Wrapper {
//  $CameraX.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  String get platformClassName => 'CameraX';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//
//  static MethodCall $bindToLifecycle(
//    LifecycleOwner owner,
//    UseCase useCase,
//  ) =>
//      MethodCall(
//        'CameraX#bindToLifecycle',
//        <String, dynamic>{
//          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
//              ? _GenericHelper.instance.getPlatformClassForType<void>()
//              : null,
//          r'owner': _setParameter(owner),
//          r'owner$isWrapper': owner != null && owner is Wrapper,
//          r'useCase': _setParameter(useCase),
//          r'useCase$isWrapper': useCase != null && useCase is Wrapper,
//        },
//      );
//
//  static MethodCall $getCameraInfo(
//    LensFacing lensFacing,
//  ) =>
//      MethodCall(
//        'CameraX#getCameraInfo',
//        <String, dynamic>{
//          r'$returnTypeIsWrapper': isTypeOf<CameraInfoX, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<CameraInfoX, Wrapper>()
//              ? _GenericHelper.instance.getPlatformClassForType<CameraInfoX>()
//              : null,
//          r'lensFacing': _setParameter(lensFacing),
//          r'lensFacing$isWrapper': lensFacing != null && lensFacing is Wrapper,
//        },
//      );
//
//  static MethodCall $unbindAll() => MethodCall(
//        'CameraX#unbindAll',
//        <String, dynamic>{
//          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
//              ? _GenericHelper.instance.getPlatformClassForType<void>()
//              : null,
//        },
//      );
//}
//
//class $LifecycleOwner extends Wrapper {
//  $LifecycleOwner.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  String get platformClassName => 'LifecycleOwner';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//}
//
//class $Preview extends Wrapper {
//  $Preview.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  $Preview.$Default(PreviewConfig previewConfig, {MethodChannel channel})
//      : super(channel) {
//    channel.invokeMethod<void>(
//      'Preview()',
//      <String, dynamic>{
//        r'$uniqueId': uniqueId,
//        r'previewConfig': _setParameter(previewConfig),
//        r'previewConfig$isWrapper':
//            previewConfig != null && previewConfig is Wrapper,
//      },
//    );
//  }
//
//  String get platformClassName => 'Preview';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//
//  MethodCall $setOnPreviewOutputUpdateListener(
//    OnPreviewOutputUpdateListener listener,
//  ) =>
//      MethodCall(
//        'Preview#setOnPreviewOutputUpdateListener',
//        <String, dynamic>{
//          r'$uniqueId': uniqueId,
//          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
//              ? _GenericHelper.instance.getPlatformClassForType<void>()
//              : null,
//          r'listener': _setParameter(listener),
//          r'listener$isWrapper': listener != null && listener is Wrapper,
//        },
//      );
//}
//
//class $OnPreviewOutputUpdateListener extends Wrapper {
//  $OnPreviewOutputUpdateListener.fromUniqueId(String uniqueId,
//      {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  $OnPreviewOutputUpdateListener.$Default({MethodChannel channel})
//      : super(channel) {
//    channel.invokeMethod<void>(
//      'OnPreviewOutputUpdateListener()',
//      <String, dynamic>{
//        r'$uniqueId': uniqueId,
//      },
//    );
//  }
//
//  String get platformClassName => 'OnPreviewOutputUpdateListener';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//      case 'OnPreviewOutputUpdateListener#onUpdated':
//        (this as OnPreviewOutputUpdateListener).onUpdated(
//          PreviewOutput.fromUniqueId(call.arguments['previewOutput']),
//        );
//        break;
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//
//  MethodCall $onUpdated(
//    PreviewOutput previewOutput,
//  ) =>
//      MethodCall(
//        'OnPreviewOutputUpdateListener#onUpdated',
//        <String, dynamic>{
//          r'$uniqueId': uniqueId,
//          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
//              ? _GenericHelper.instance.getPlatformClassForType<void>()
//              : null,
//          r'previewOutput': _setParameter(previewOutput),
//          r'previewOutput$isWrapper':
//              previewOutput != null && previewOutput is Wrapper,
//        },
//      );
//}
//
//class $PreviewOutput extends Wrapper {
//  $PreviewOutput.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  String get platformClassName => 'PreviewOutput';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//
//  MethodCall $getSurfaceTexture() => MethodCall(
//        'PreviewOutput#getSurfaceTexture',
//        <String, dynamic>{
//          r'$uniqueId': uniqueId,
//          r'$returnTypeIsWrapper': isTypeOf<SurfaceTexture, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<SurfaceTexture, Wrapper>()
//              ? _GenericHelper.instance
//                  .getPlatformClassForType<SurfaceTexture>()
//              : null,
//        },
//      );
//}
//
//class $PreviewConfig extends Wrapper {
//  $PreviewConfig.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  String get platformClassName => 'PreviewConfig';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//}
//
//class $PreviewConfigBuilder extends Wrapper {
//  $PreviewConfigBuilder.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  $PreviewConfigBuilder.$Default({MethodChannel channel}) : super(channel) {
//    channel.invokeMethod<void>(
//      'PreviewConfigBuilder()',
//      <String, dynamic>{
//        r'$uniqueId': uniqueId,
//      },
//    );
//  }
//
//  String get platformClassName => 'PreviewConfigBuilder';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//
//  MethodCall $setLensFacing(
//    LensFacing lensFacing,
//  ) =>
//      MethodCall(
//        'PreviewConfigBuilder#setLensFacing',
//        <String, dynamic>{
//          r'$uniqueId': uniqueId,
//          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
//              ? _GenericHelper.instance.getPlatformClassForType<void>()
//              : null,
//          r'lensFacing': _setParameter(lensFacing),
//          r'lensFacing$isWrapper': lensFacing != null && lensFacing is Wrapper,
//        },
//      );
//
//  MethodCall $build() => MethodCall(
//        'PreviewConfigBuilder#build',
//        <String, dynamic>{
//          r'$uniqueId': uniqueId,
//          r'$returnTypeIsWrapper': isTypeOf<PreviewConfig, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<PreviewConfig, Wrapper>()
//              ? _GenericHelper.instance.getPlatformClassForType<PreviewConfig>()
//              : null,
//        },
//      );
//}
//
//class $TextureView extends Wrapper {
//  $TextureView.fromUniqueId(String uniqueId, {MethodChannel channel})
//      : assert(uniqueId != null),
//        super(channel, uniqueId);
//
//  $TextureView.$Default(Context context, {MethodChannel channel})
//      : super(channel) {
//    channel.invokeMethod<void>(
//      'TextureView()',
//      <String, dynamic>{
//        r'$uniqueId': uniqueId,
//        r'context': _setParameter(context),
//        r'context$isWrapper': context != null && context is Wrapper,
//      },
//    );
//  }
//
//  String get platformClassName => 'TextureView';
//
//  @override
//  Future<void> onMethodCall(MethodCall call) async {
//    switch (call.method) {
//    }
//    throw UnimplementedError('No implementation for ${call.method}.');
//  }
//
//  MethodCall $setSurfaceTexture(
//    SurfaceTexture surfaceTexture,
//  ) =>
//      MethodCall(
//        'TextureView#setSurfaceTexture',
//        <String, dynamic>{
//          r'$uniqueId': uniqueId,
//          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
//          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
//              ? _GenericHelper.instance.getPlatformClassForType<void>()
//              : null,
//          r'surfaceTexture': _setParameter(surfaceTexture),
//          r'surfaceTexture$isWrapper':
//              surfaceTexture != null && surfaceTexture is Wrapper,
//        },
//      );
//}
//
//class _GenericHelper extends GenericHelper {
//  const _GenericHelper._();
//
//  static final _GenericHelper instance = _GenericHelper._();
//
//  String getPlatformClassForType<T>() {
//    if (isTypeOf<T, UseCase>()) {
//      return 'UseCase';
//    } else if (isTypeOf<T, LensFacing>()) {
//      return 'LensFacing';
//    } else if (isTypeOf<T, CameraInfoX>()) {
//      return 'CameraInfo';
//    } else if (isTypeOf<T, CameraX>()) {
//      return 'CameraX';
//    } else if (isTypeOf<T, LifecycleOwner>()) {
//      return 'LifecycleOwner';
//    } else if (isTypeOf<T, Preview>()) {
//      return 'Preview';
//    } else if (isTypeOf<T, OnPreviewOutputUpdateListener>()) {
//      return 'OnPreviewOutputUpdateListener';
//    } else if (isTypeOf<T, PreviewOutput>()) {
//      return 'PreviewOutput';
//    } else if (isTypeOf<T, PreviewConfig>()) {
//      return 'PreviewConfig';
//    } else if (isTypeOf<T, PreviewConfigBuilder>()) {
//      return 'PreviewConfigBuilder';
//    } else if (isTypeOf<T, TextureView>()) {
//      return 'TextureView';
//    } else if (isTypeOf<T, SurfaceTexture>()) {
//      return 'SurfaceTexture';
//    } else if (isTypeOf<T, Context>()) {
//      return 'Context';
//    }
//
//    throw UnsupportedError(
//        'Could not find platform class name for ${T.toString()}');
//  }
//
//  T getWrapperForType<T>(String uniqueId) {
//    assert(isTypeOf<T, Wrapper>());
//
//    if (isTypeOf<T, UseCase>()) {
//      return UseCase.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, LensFacing>()) {
//      return LensFacing.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, CameraInfoX>()) {
//      return CameraInfoX.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, CameraX>()) {
//      return CameraX.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, LifecycleOwner>()) {
//      return LifecycleOwner.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, Preview>()) {
//      return Preview.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, OnPreviewOutputUpdateListener>()) {
//      return OnPreviewOutputUpdateListener.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, PreviewOutput>()) {
//      return PreviewOutput.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, PreviewConfig>()) {
//      return PreviewConfig.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, PreviewConfigBuilder>()) {
//      return PreviewConfigBuilder.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, TextureView>()) {
//      return TextureView.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, SurfaceTexture>()) {
//      return SurfaceTexture.fromUniqueId(uniqueId) as T;
//    } else if (isTypeOf<T, Context>()) {
//      return Context.fromUniqueId(uniqueId) as T;
//    }
//
//    throw UnsupportedError('Could not instantiate class ${T.toString()}');
//  }
//}
//
//dynamic _setParameter(dynamic parameter) {
//  if (parameter == null) return null;
//  if (parameter is Wrapper) return (parameter as Wrapper).uniqueId;
//  return parameter;
//}
