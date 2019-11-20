import 'dart:async';

import 'package:flutter/widgets.dart';

/// Location of the camera on the device.
enum LensDirection { front, back, unknown }

/// Abstract class used to create a common interface to describe a camera from different platform APIs.
///
/// This provides information such as the [name] of the camera and [direction]
/// the lens face.
abstract class CameraDescription {
  /// Location of the camera on the device.
  LensDirection get direction;

  /// Unique identifier for this camera.
  String get name;
}

/// Abstract class used to create a common interface across platform APIs.
abstract class CameraConfigurator {
  CameraConfigurator(this.cameraDescription)
      : assert(cameraDescription != null);

  static const String _notInitializedMsg = 'Please call initialize() first.';
  static const String _isDisposedMsg =
      'This CameraConfigurator has already been disposed.';

  bool _isInitialized = false;
  bool _isDisposed = false;

  final CameraDescription cameraDescription;

  /// Retrieve a [Widget] that displays the preview frames of the camera.
  ///
  /// Throws an [AssertionError] if [initialize] was not called first or
  /// [dispose] was called.
  @mustCallSuper
  Future<Widget> getPreviewWidget() {
    assert(!_isDisposed, _isDisposedMsg);
    assert(_isInitialized, _notInitializedMsg);
    return Future<Widget>.value(Container());
  }

  /// Initializes the camera on the device.
  ///
  /// This can safely be called multiple times.
  ///
  /// This will throw an [AssertionError] if [dispose] was called.
  @mustCallSuper
  Future<void> initialize() {
    assert(!_isDisposed, _isDisposedMsg);
    if (_isInitialized) return Future<void>.value();
    _isInitialized = true;

    return Future<void>.value();
  }

  /// Begins the flow of data between the inputs and outputs connected to the camera instance.
  ///
  /// Throws an [AssertionError] if [initialize] was not called first or
  /// [dispose] was called.
  @mustCallSuper
  Future<void> start() {
    assert(!_isDisposed, _isDisposedMsg);
    assert(_isInitialized, _notInitializedMsg);

    return Future<void>.value();
  }

  /// Stops the flow of data between the inputs and outputs connected to the camera instance.
  ///
  /// Throws an [AssertionError] if [initialize] was not called first or
  /// [dispose] was called.
  @mustCallSuper
  Future<void> stop() {
    assert(!_isDisposed, _isDisposedMsg);
    assert(_isInitialized, _notInitializedMsg);

    return Future<void>.value();
  }

  /// Dispose all resources and disables further use of this configurator.
  ///
  /// This can be safely called multiple times.
  @mustCallSuper
  Future<void> dispose() {
    if (_isDisposed) return Future<void>.value();
    _isDisposed = true;

    return Future<void>.value();
  }
}
