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

  final CameraDescription cameraDescription;

  /// Retrieve a [Widget] that displays the preview frames of the camera.
  Future<Widget> getPreviewWidget();

  /// Initializes the camera on the device.
  Future<void> initialize();

  /// Begins the flow of data between the inputs and outputs connected to the camera instance.
  Future<void> start();

  /// Stops the flow of data between the inputs and outputs connected to the camera instance.
  Future<void> stop();

  /// Dispose all resources and disables further use of this configurator.
  Future<void> dispose();
}
