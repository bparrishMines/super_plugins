// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************

part of 'foundation.dart';

class $NSError extends Wrapper {
  $NSError.fromUniqueId(
    String uniqueId, {
    MethodChannel channel,
    bool addToManager = true,
  })  : assert(uniqueId != null),
        super(channel, uniqueId, addToManager);

  String get platformClassName => 'NSError';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $CaptureDeviceInput extends Wrapper {
  $CaptureDeviceInput.fromUniqueId(
    String uniqueId, {
    MethodChannel channel,
    bool addToManager = true,
  })  : assert(uniqueId != null),
        super(channel, uniqueId, addToManager);

  $CaptureDeviceInput.initWithDevice(CaptureDevice device, NSError error,
      {MethodChannel channel})
      : super(channel) {
    channel.invokeMethod<void>(
      'AVCaptureDeviceInput(initWithDevice)',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'device': _setParameter(device),
        r'device$isWrapper': device != null && device is Wrapper,
        r'error': _setParameter(error),
        r'error$isWrapper': error != null && error is Wrapper,
      },
    );
  }

  String get platformClassName => 'AVCaptureDeviceInput';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $CaptureSession extends Wrapper {
  $CaptureSession.fromUniqueId(
    String uniqueId, {
    MethodChannel channel,
    bool addToManager = true,
  })  : assert(uniqueId != null),
        super(channel, uniqueId, addToManager);

  $CaptureSession.$Default({MethodChannel channel}) : super(channel) {
    channel.invokeMethod<void>(
      'AVCaptureSession()',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  String get platformClassName => 'AVCaptureSession';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $startRunning() => MethodCall(
        'AVCaptureSession#startRunning',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
        },
      );

  MethodCall $addInput(
    CaptureDeviceInput input,
  ) =>
      MethodCall(
        'AVCaptureSession#addInput',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
          r'input': _setParameter(input),
          r'input$isWrapper': input != null && input is Wrapper,
        },
      );

  MethodCall $stopRunning() => MethodCall(
        'AVCaptureSession#stopRunning',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
        },
      );
}

class $CaptureDevice extends Wrapper {
  $CaptureDevice.fromUniqueId(
    String uniqueId, {
    MethodChannel channel,
    bool addToManager = true,
  })  : assert(uniqueId != null),
        super(channel, uniqueId, addToManager);

  String get platformClassName => 'AVCaptureDevice';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $get$uniqueID() => MethodCall(
        'AVCaptureDevice.uniqueID',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
        },
      );

  MethodCall $set$uniqueID(
    String uniqueID,
  ) =>
      MethodCall(
        'AVCaptureDevice.uniqueID',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'uniqueID': _setParameter(uniqueID),
          r'uniqueID$isWrapper': uniqueID != null && uniqueID is Wrapper,
        },
      );

  MethodCall $get$position() => MethodCall(
        'AVCaptureDevice.position',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
        },
      );

  MethodCall $set$position(
    int position,
  ) =>
      MethodCall(
        'AVCaptureDevice.position',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'position': _setParameter(position),
          r'position$isWrapper': position != null && position is Wrapper,
        },
      );

  static MethodCall $devicesWithMediaType(
    String mediaType,
  ) =>
      MethodCall(
        'AVCaptureDevice#devicesWithMediaType',
        <String, dynamic>{
          r'$returnTypeIsWrapper': isTypeOf<Array<CaptureDevice>, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<Array<CaptureDevice>, Wrapper>()
              ? _GenericHelper.instance
                  .getPlatformClassForType<Array<CaptureDevice>>()
              : null,
          r'mediaType': _setParameter(mediaType),
          r'mediaType$isWrapper': mediaType != null && mediaType is Wrapper,
        },
      );

  static MethodCall $deviceWithUniqueID(
    String deviceUniqueId,
  ) =>
      MethodCall(
        'AVCaptureDevice#deviceWithUniqueID',
        <String, dynamic>{
          r'$returnTypeIsWrapper': isTypeOf<CaptureDevice, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<CaptureDevice, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<CaptureDevice>()
              : null,
          r'deviceUniqueId': _setParameter(deviceUniqueId),
          r'deviceUniqueId$isWrapper':
              deviceUniqueId != null && deviceUniqueId is Wrapper,
        },
      );
}

class $Array<T> extends Wrapper {
  $Array.fromUniqueId(
    String uniqueId, {
    MethodChannel channel,
    bool addToManager = true,
  })  : assert(uniqueId != null),
        super(channel, uniqueId, addToManager);

  String get platformClassName => 'NSArray';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $get$count() => MethodCall(
        'NSArray.count',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
        },
      );

  MethodCall $set$count(
    int count,
  ) =>
      MethodCall(
        'NSArray.count',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'count': _setParameter(count),
          r'count$isWrapper': count != null && count is Wrapper,
        },
      );

  MethodCall $objectAtIndex(
    int index,
  ) =>
      MethodCall(
        'NSArray#objectAtIndex',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<T, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<T, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<T>()
              : null,
          r'index': _setParameter(index),
          r'index$isWrapper': index != null && index is Wrapper,
        },
      );
}

class $View extends Wrapper {
  $View.fromUniqueId(
    String uniqueId, {
    MethodChannel channel,
    bool addToManager = true,
  })  : assert(uniqueId != null),
        super(channel, uniqueId, addToManager);

  $View.initWithFrame(CGRect frame, {MethodChannel channel}) : super(channel) {
    channel.invokeMethod<void>(
      'CAMAutoresizeLayerView(initWithFrame)',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'frame': _setParameter(frame),
        r'frame$isWrapper': frame != null && frame is Wrapper,
      },
    );
  }

  String get platformClassName => 'CAMAutoresizeLayerView';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $get$layer() => MethodCall(
        'CAMAutoresizeLayerView.layer',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
        },
      );

  MethodCall $set$layer(
    Layer layer,
  ) =>
      MethodCall(
        'CAMAutoresizeLayerView.layer',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'layer': _setParameter(layer),
          r'layer$isWrapper': layer != null && layer is Wrapper,
        },
      );
}

class $CaptureVideoPreviewLayer extends Wrapper {
  $CaptureVideoPreviewLayer.fromUniqueId(
    String uniqueId, {
    MethodChannel channel,
    bool addToManager = true,
  })  : assert(uniqueId != null),
        super(channel, uniqueId, addToManager);

  $CaptureVideoPreviewLayer.$Default({MethodChannel channel}) : super(channel) {
    channel.invokeMethod<void>(
      'AVCaptureVideoPreviewLayer()',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  String get platformClassName => 'AVCaptureVideoPreviewLayer';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $get$session() => MethodCall(
        'AVCaptureVideoPreviewLayer.session',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
        },
      );

  MethodCall $set$session(
    CaptureSession session,
  ) =>
      MethodCall(
        'AVCaptureVideoPreviewLayer.session',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'session': _setParameter(session),
          r'session$isWrapper': session != null && session is Wrapper,
        },
      );

  MethodCall $addSublayer(
    Layer layer,
  ) =>
      MethodCall(
        'AVCaptureVideoPreviewLayer#addSublayer',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
          r'layer': _setParameter(layer),
          r'layer$isWrapper': layer != null && layer is Wrapper,
        },
      );
}

class $Layer extends Wrapper {
  $Layer.fromUniqueId(
    String uniqueId, {
    MethodChannel channel,
    bool addToManager = true,
  })  : assert(uniqueId != null),
        super(channel, uniqueId, addToManager);

  String get platformClassName => 'CALayer';

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $addSublayer(
    Layer layer,
  ) =>
      MethodCall(
        'CALayer#addSublayer',
        <String, dynamic>{
          r'$uniqueId': uniqueId,
          r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
          r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
              ? _GenericHelper.instance.getPlatformClassForType<void>()
              : null,
          r'layer': _setParameter(layer),
          r'layer$isWrapper': layer != null && layer is Wrapper,
        },
      );
}

class _GenericHelper extends GenericHelper {
  const _GenericHelper._();

  static final _GenericHelper instance = _GenericHelper._();

  String getPlatformClassForType<T>() {
    if (isTypeOf<T, NSError>()) {
      return 'NSError';
    } else if (isTypeOf<T, CaptureDeviceInput>()) {
      return 'AVCaptureDeviceInput';
    } else if (isTypeOf<T, CaptureSession>()) {
      return 'AVCaptureSession';
    } else if (isTypeOf<T, CaptureDevice>()) {
      return 'AVCaptureDevice';
    } else if (isTypeOf<T, Array>()) {
      return 'NSArray';
    } else if (isTypeOf<T, View>()) {
      return 'CAMAutoresizeLayerView';
    } else if (isTypeOf<T, CaptureVideoPreviewLayer>()) {
      return 'AVCaptureVideoPreviewLayer';
    } else if (isTypeOf<T, Layer>()) {
      return 'CALayer';
    } else if (isTypeOf<T, CGRect>()) {
      return 'CGRect';
    }

    throw UnsupportedError(
        'Could not find platform class name for ${T.toString()}');
  }

  T getWrapperForType<T>(String uniqueId) {
    assert(isTypeOf<T, Wrapper>());

    if (isTypeOf<T, NSError>()) {
      return NSError.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, CaptureDeviceInput>()) {
      return CaptureDeviceInput.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, CaptureSession>()) {
      return CaptureSession.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, CaptureDevice>()) {
      return CaptureDevice.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, Array>()) {
      return Array.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, View>()) {
      return View.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, CaptureVideoPreviewLayer>()) {
      return CaptureVideoPreviewLayer.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, Layer>()) {
      return Layer.fromUniqueId(uniqueId) as T;
    } else if (isTypeOf<T, CGRect>()) {
      return CGRect.fromUniqueId(uniqueId) as T;
    }

    throw UnsupportedError('Could not instantiate class ${T.toString()}');
  }
}

dynamic _setParameter(dynamic parameter) {
  if (parameter == null) return null;
  if (parameter is Wrapper) return (parameter as Wrapper).uniqueId;
  return parameter;
}
