part of 'foundation.dart';

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

class $View extends IosWrapper {
  $View(
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

  MethodCall $ViewinitWithFrame(
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
}

class _GenericHelper {
  _GenericHelper._();

  static Wrapper getWrapperForType<T>(String uniqueId) {
    assert(isTypeOf<T, Wrapper>());

    if (isTypeOf<T, CaptureSession>()) {
      return $CaptureSession(uniqueId);
    } else if (isTypeOf<T, CaptureDevice>()) {
      return $CaptureDevice(uniqueId);
    } else if (isTypeOf<T, Array>()) {
      return $Array(uniqueId);
    } else if (isTypeOf<T, View>()) {
      return $View(uniqueId);
    } else if (isTypeOf<T, CGRect>()) {
      return $CGRect(uniqueId);
    }

    throw UnsupportedError('Could not instantiate class ${T.toString()}');
  }

  static FutureOr<dynamic> onAllocated(Wrapper wrapper) {
    if (wrapper is $CaptureSession) {
      return CaptureSession.onAllocated(wrapper as $CaptureSession);
    } else if (wrapper is $CaptureDevice) {
      return CaptureDevice.onAllocated(wrapper as $CaptureDevice);
    } else if (wrapper is $Array) {
      return Array.onAllocated(wrapper as $Array);
    } else if (wrapper is $View) {
      return View.onAllocated(wrapper as $View);
    } else if (wrapper is $CGRect) {
      return CGRect.onAllocated(wrapper as $CGRect);
    }

    throw UnsupportedError(
        'Could not instantiate class ${wrapper.runtimeType}');
  }
}
