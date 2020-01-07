part of 'foundation.dart';

class $NSError extends IosWrapper {
  $NSError(
    String uniqueId, {
    List<MethodCall> Function(CGRect cgRect) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'NSError',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }
}

class $CaptureDeviceInput extends IosWrapper {
  $CaptureDeviceInput(
    String uniqueId, {
    List<MethodCall> Function(CGRect cgRect) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'AVCaptureDeviceInput',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $CaptureDeviceInputinitWithDevice(
    CaptureDevice device,
    NSError error,
  ) {
    return MethodCall(
      'AVCaptureDeviceInput(initWithDevice)',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        'device': (device as Wrapper)?.uniqueId,
        'error': (error as Wrapper)?.uniqueId,
      },
    );
  }
}

class $CaptureSession extends IosWrapper {
  $CaptureSession(
    String uniqueId, {
    List<MethodCall> Function(CGRect cgRect) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'AVCaptureSession',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $CaptureSession$Default() {
    return MethodCall(
      'AVCaptureSession()',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  MethodCall $startRunning([
    String $newUniqueId,
  ]) {
    return MethodCall(
      'AVCaptureSession#startRunning',
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

  MethodCall $addInput(
    CaptureDeviceInput input, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'AVCaptureSession#addInput',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'input': (input as Wrapper)?.uniqueId,
      },
    );
  }
}

class $CaptureDevice extends IosWrapper {
  $CaptureDevice(
    String uniqueId, {
    List<MethodCall> Function(CGRect cgRect) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'AVCaptureDevice',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $uniqueID({
    String uniqueID,
    String $newUniqueId,
  }) {
    return MethodCall(
      'AVCaptureDevice.uniqueID',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        if (uniqueID != null) 'uniqueID': uniqueID,
      },
    );
  }

  MethodCall $position({
    int position,
    String $newUniqueId,
  }) {
    return MethodCall(
      'AVCaptureDevice.position',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        if (position != null) 'position': position,
      },
    );
  }

  static MethodCall $devicesWithMediaType(
    String mediaType, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'AVCaptureDevice#devicesWithMediaType',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'mediaType': mediaType,
      },
    );
  }
}

class $Array<T> extends IosWrapper {
  $Array(
    String uniqueId, {
    List<MethodCall> Function(CGRect cgRect) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'NSArray',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $count({
    int count,
    String $newUniqueId,
  }) {
    return MethodCall(
      'NSArray.count',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        if (count != null) 'count': count,
      },
    );
  }

  MethodCall $objectAtIndex(
    int index, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'NSArray#objectAtIndex',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<T, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<T, Wrapper>()
            ? _GenericHelper.getWrapperForType<T>('').platformClassName
            : null,
        'index': index,
      },
    );
  }
}

class $_ViewState extends IosWrapper {
  $_ViewState(
    String uniqueId, {
    List<MethodCall> Function(CGRect cgRect) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'UIView',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $_ViewStateinitWithFrame(
    CGRect rect,
  ) {
    return MethodCall(
      'UIView(initWithFrame)',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        'rect': (rect as Wrapper)?.uniqueId,
      },
    );
  }

  MethodCall $layer({
    Layer layer,
    String $newUniqueId,
  }) {
    return MethodCall(
      'UIView.layer',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        if (layer != null) 'layer': (layer as Wrapper)?.uniqueId,
      },
    );
  }
}

class $CaptureVideoPreviewLayer extends IosWrapper {
  $CaptureVideoPreviewLayer(
    String uniqueId, {
    List<MethodCall> Function(CGRect cgRect) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'AVCaptureVideoPreviewLayer',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $CaptureVideoPreviewLayer$Default() {
    return MethodCall(
      'AVCaptureVideoPreviewLayer()',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
      },
    );
  }

  MethodCall $session({
    CaptureSession session,
    String $newUniqueId,
  }) {
    return MethodCall(
      'AVCaptureVideoPreviewLayer.session',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        if (session != null) 'session': (session as Wrapper)?.uniqueId,
      },
    );
  }

  MethodCall $addSublayer(
    Layer layer, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'AVCaptureVideoPreviewLayer#addSublayer',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'layer': (layer as Wrapper)?.uniqueId,
      },
    );
  }
}

class $Layer extends IosWrapper {
  $Layer(
    String uniqueId, {
    List<MethodCall> Function(CGRect cgRect) onCreateView,
  }) : super(
          uniqueId: uniqueId,
          platformClassName: 'CALayer',
          onCreateView: onCreateView,
        );

  @override
  Future<void> onMethodCall(MethodCall call) async {
    switch (call.method) {
    }
    throw UnimplementedError('No implementation for ${call.method}.');
  }

  MethodCall $addSublayer(
    Layer layer, [
    String $newUniqueId,
  ]) {
    return MethodCall(
      'CALayer#addSublayer',
      <String, dynamic>{
        r'$uniqueId': uniqueId,
        r'$newUniqueId': $newUniqueId,
        r'$returnTypeIsWrapper': isTypeOf<void, Wrapper>(),
        r'$returnTypePlatformName': isTypeOf<void, Wrapper>()
            ? _GenericHelper.getWrapperForType<void>('').platformClassName
            : null,
        'layer': (layer as Wrapper)?.uniqueId,
      },
    );
  }
}

class _GenericHelper {
  _GenericHelper._();

  static Wrapper getWrapperForType<T>(String uniqueId) {
    assert(isTypeOf<T, Wrapper>());

    if (isTypeOf<T, NSError>()) {
      return $NSError(uniqueId);
    } else if (isTypeOf<T, CaptureDeviceInput>()) {
      return $CaptureDeviceInput(uniqueId);
    } else if (isTypeOf<T, CaptureSession>()) {
      return $CaptureSession(uniqueId);
    } else if (isTypeOf<T, CaptureDevice>()) {
      return $CaptureDevice(uniqueId);
    } else if (isTypeOf<T, Array>()) {
      return $Array(uniqueId);
    } else if (isTypeOf<T, _ViewState>()) {
      return $_ViewState(uniqueId);
    } else if (isTypeOf<T, CaptureVideoPreviewLayer>()) {
      return $CaptureVideoPreviewLayer(uniqueId);
    } else if (isTypeOf<T, Layer>()) {
      return $Layer(uniqueId);
    } else if (isTypeOf<T, CGRect>()) {
      return $CGRect(uniqueId);
    }

    throw UnsupportedError('Could not instantiate class ${T.toString()}');
  }

  static FutureOr<dynamic> onAllocated(Wrapper wrapper) {
    if (wrapper is $NSError) {
      return NSError.onAllocated(wrapper as $NSError);
    } else if (wrapper is $CaptureDeviceInput) {
      return CaptureDeviceInput.onAllocated(wrapper as $CaptureDeviceInput);
    } else if (wrapper is $CaptureSession) {
      return CaptureSession.onAllocated(wrapper as $CaptureSession);
    } else if (wrapper is $CaptureDevice) {
      return CaptureDevice.onAllocated(wrapper as $CaptureDevice);
    } else if (wrapper is $Array) {
      return Array.onAllocated(wrapper as $Array);
    } else if (wrapper is $_ViewState) {
      return _ViewState.onAllocated(wrapper as $_ViewState);
    } else if (wrapper is $CaptureVideoPreviewLayer) {
      return CaptureVideoPreviewLayer.onAllocated(
          wrapper as $CaptureVideoPreviewLayer);
    } else if (wrapper is $Layer) {
      return Layer.onAllocated(wrapper as $Layer);
    } else if (wrapper is $CGRect) {
      return CGRect.onAllocated(wrapper as $CGRect);
    }

    throw UnsupportedError(
        'Could not instantiate class ${wrapper.runtimeType}');
  }
}
