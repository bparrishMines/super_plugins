import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:reference/reference.dart';
import 'package:super_camera/src/android/camerax_manager.dart';

final CameraXManager _manager = CameraXManager(
  LocalHandler(
    createCamera: () => Camera._(),
  ),
)..initialize();

mixin UseCase implements LocalReference {}

// Instanced Class + data class
class Preview with UseCase {
  Preview();

  int _currentTexture;

  Future<int> attachToTexture() async {
    assert(_manager.getPairedRemoteReference(this) != null);

    return _currentTexture ??= await _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'attachToTexture',
    );
  }

  Future<void> releaseTexture() {
    assert(_manager.getPairedRemoteReference(this) != null);

    _currentTexture = null;
    return _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'releaseTexture',
    );
  }

  @override
  Type get referenceType => Preview;
}

// Instanced class
class SuccessListener implements LocalReference {
  SuccessListener({@required this.onSuccess, @required this.onError})
      : assert(onSuccess != null),
        assert(onError != null);

  final void Function() onSuccess;

  final void Function(String code, String message) onError;

  @override
  Type get referenceType => SuccessListener;
}

// Singleton Class
class ProcessCameraProvider implements LocalReference {
  ProcessCameraProvider._() {
    _manager.pairWithNewRemoteReference(this);
  }

  static final ProcessCameraProvider instance = ProcessCameraProvider._();

  Set<LocalReference> _dependentReferences = <LocalReference>{};

  void initialize(SuccessListener listener) {
    _manager.pairWithNewRemoteReference(listener);

    _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'initialize',
      <Object>[listener],
    );
  }

  Future<Camera> bindToLifecycle(
    CameraSelector selector,
    UseCase useCase,
  ) async {
    _manager.pairWithNewRemoteReference(useCase);
    _dependentReferences.add(useCase);

    final Camera camera = await _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'bindToLifecycle',
      <Object>[selector, useCase],
    );
    _dependentReferences.add(camera);
    return camera;
  }

  Future<void> unbindAll() async {
    for (LocalReference localReference in _dependentReferences) {
      _manager.disposePairWithLocalReference(localReference);
    }
    _dependentReferences.clear();

    return _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'unbindAll',
    );
  }

  @override
  Type get referenceType => ProcessCameraProvider;
}

// Instance Class
class Camera implements LocalReference {
  Camera._();

  @override
  Type get referenceType => Camera;
}

// Data Class
class CameraSelector implements LocalReference {
  CameraSelector(this.lensFacing);

  static const lensFacingFront = 0;
  static const lensFacingBack = 1;

  final int lensFacing;

  @override
  Type get referenceType => CameraSelector;
}
