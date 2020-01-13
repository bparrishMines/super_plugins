import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:penguin_plugin/penguin_plugin.dart';
import 'package:super_camera/src/interface/camera_interface.dart';

import '../common/texture_registry.dart';
import '../../common/channel.dart';

part 'camerax.android.penguin.g.dart';

/// The use case which all other use cases are built on top of.
///
/// A [UseCase] provides functionality to map the set of arguments in a use case
/// to arguments that are usable by a camera. UseCase also will communicate of
/// the active/inactive state to the Camera.
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['UseCase']),
  ),
  androidApi: AndroidApi(21),
)
class UseCase extends $UseCase {
  UseCase.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);
}

/// The direction the camera faces relative to device screen.
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core.CameraX', <String>['LensFacing']),
  ),
  androidApi: AndroidApi(21),
)
class LensFacing extends $LensFacing {
  LensFacing.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  /// A camera on the device facing the opposite direction as the device's screen.
  @Field(nameOverride: 'BACK')
  // ignore: non_constant_identifier_names
  static Future<LensFacing> get back =>
      invoke<LensFacing>(Common.channel, [$LensFacing.$get$BACK()],
          genericHelper: _GenericHelper.instance);

  /// A camera on the device facing the same direction as the device's screen.
  @Field(nameOverride: 'FRONT')
  // ignore: non_constant_identifier_names
  static Future<LensFacing> get front =>
      invoke<LensFacing>(Common.channel, [$LensFacing.$get$FRONT()],
          genericHelper: _GenericHelper.instance);
}

/// An interface for retrieving camera information.
///
/// Applications can retrieve an instance via
/// ```
/// CameraX.getCameraInfo(LensFacing).
/// ```
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['CameraInfo']),
  ),
  androidApi: AndroidApi(21),
)
class CameraInfoX extends $CameraInfoX {
  CameraInfoX.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  /// Returns the sensor rotation, in degrees, relative to the device's "natural" rotation.
  @Method()
  Future<int> getSensorRotationDegrees() =>
      invoke<int>(Common.channel, [$getSensorRotationDegrees()]);

//  /// The direction the camera faces relative to device screen.
//  LensFacing getLensFacing() => _lensFacing;

//  @override
//  LensDirection get direction {
//    if (_lensFacing == LensFacing.FRONT) return LensDirection.front;
//    if (_lensFacing == LensFacing.BACK) return LensDirection.back;
//    throw StateError('No direction for $LensFacing');
//  }
//
//  @override
//  String get name {
//    if (_lensFacing == LensFacing.FRONT) return 'FRONT';
//    if (_lensFacing == LensFacing.BACK) return 'BACK';
//    throw StateError('No name for $LensFacing');
//  }
}

/// Main interface for accessing CameraX library.
///
/// This is a singleton class responsible for managing the set of camera
/// instances and attached use cases such as [Preview].
///
/// Use cases are bound to a LifecycleOwner by calling
/// `bindToLifecycle(LifecycleOwner, UseCase)` Once bound, the lifecycle of the
/// LifecycleOwner determines when the camera is started and stopped, and when
/// camera data is available to the use case.
///
/// It is often sufficient to just bind the use cases once and let the lifecycle
/// handle the rest, so application code generally does not need to call
/// [unbind] nor call [bindToLifecycle] more than once.
///
/// If the camera is not already closed, unbinding all use cases will cause the
/// camera to close asynchronously.
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['CameraX']),
  ),
  androidApi: AndroidApi(21),
)
class CameraX extends $CameraX {
  CameraX.fromUniqueId(String uniqueId) : super.fromUniqueId(null);

  /// Binds a [UseCase] to a LifecycleOwner.
  ///
  /// The state of the lifecycle will determine when the cameras are open,
  /// started, stopped and closed. When started, the [UseCase] receives camera
  /// data.
  ///
  /// Currently up to 3 use cases may be bound to a [Lifecycle] at any time.
  /// Exceeding capability of target camera device will throw a
  /// PlatformException.
  @Method()
  static Future<void> bindToLifecycle(LifecycleOwner owner, UseCase useCase) =>
      invoke<void>(Common.channel, [$CameraX.$bindToLifecycle(owner, useCase)]);

  /// Returns the camera info for the camera with the given lens facing.
  @Method()
  static Future<CameraInfoX> getCameraInfo(LensFacing lensFacing) =>
      invoke<CameraInfoX>(
        Common.channel,
        [$CameraX.$getCameraInfo(lensFacing)],
        genericHelper: _GenericHelper.instance,
      );

  /// Unbinds all use cases from the lifecycle and removes them from CameraX.
  ///
  /// This will initiate a close of every currently open camera.
  @Method()
  static Future<void> unbindAll() =>
      invoke<void>(Common.channel, [$CameraX.$unbindAll()]);
}

/// A class that has an Android lifecycle.
///
/// These events can be used by custom components to handle lifecycle changes
/// without implementing any code.
///
/// Get the instance provide by this app from [instance].
@Class(AndroidPlatform(
  AndroidType('androidx.lifecycle', <String>['LifecycleOwner']),
))
class LifecycleOwner extends $LifecycleOwner {
  LifecycleOwner.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  static final LifecycleOwner instance =
      LifecycleOwner.fromUniqueId('lifecycle_owner');
}

/// A use case that provides a camera preview stream for displaying on-screen.
///
/// The preview stream is connected to an underlying [SurfaceTexture].
/// This [SurfaceTexture] is created by the [Preview] use case and provided as
/// an output after it is configured and attached to the camera. The application
/// receives the [SurfaceTexture] by setting an output listener with
/// `setOnPreviewOutputUpdateListener(OnPreviewOutputUpdateListener)`.
/// When the lifecycle becomes active, the camera will start and images will be
/// streamed to the [SurfaceTexture].
/// `Preview.OnPreviewOutputUpdateListener.onUpdated(PreviewOutput)` is called
/// when a new [SurfaceTexture] is created. A [SurfaceTexture] is created each
/// time the use case becomes active and no previous [SurfaceTexture] exists.
///
/// The application can then decide how this texture is shown. The texture data
/// is as received by the camera system with no rotation applied. To display the
/// SurfaceTexture with the correct orientation, the rotation parameter sent to
/// [Preview] [OnPreviewOutputUpdateListener] can be used to create a correct
/// transformation matrix for display. See
/// setOnPreviewOutputUpdateListener(OnPreviewOutputUpdateListener) for notes if
/// attaching the SurfaceTexture to [TextureViewWidget].
///
/// The application is responsible for managing SurfaceTexture after receiving
/// it.
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['Preview']),
  ),
  androidApi: AndroidApi(21),
)
class Preview extends $Preview implements UseCase {
  @Constructor()
  Preview(PreviewConfig previewConfig)
      : super.$Default(previewConfig, channel: Common.channel);

  Preview.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  /// Sets a listener to get the [PreviewOutput] updates.
  @Method()
  Future<void> setOnPreviewOutputUpdateListener(
    OnPreviewOutputUpdateListener listener,
  ) =>
      invoke<void>(
        Common.channel,
        [$setOnPreviewOutputUpdateListener(listener)],
      );
}

/// A listener of [PreviewOutput].
///
/// TODO(b/117519540): Mark as deprecated once PreviewSurfaceCallback is ready.
@Class(
  AndroidPlatform(
    AndroidType(
      'androidx.camera.core.Preview',
      <String>['OnPreviewOutputUpdateListener'],
    ),
  ),
  androidApi: AndroidApi(21),
)
class OnPreviewOutputUpdateListener extends $OnPreviewOutputUpdateListener {
  @Constructor()
  OnPreviewOutputUpdateListener() : super.$Default(channel: Common.channel);

  OnPreviewOutputUpdateListener.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  /// Callback when [PreviewOutput] has been updated.
  @Method(callback: true)
  void onUpdated(PreviewOutput previewOutput) =>
      invoke<void>(Common.channel, [$onUpdated(previewOutput)]);
}

/// A bundle containing a [SurfaceTexture] and properties needed to display a [Preview].
@Class(
  AndroidPlatform(
    AndroidType(
      'androidx.camera.core.Preview',
      <String>['PreviewOutput'],
    ),
  ),
  androidApi: AndroidApi(21),
)
class PreviewOutput extends $PreviewOutput {
  PreviewOutput.fromUniqueId(String uniqueId)
      : super.fromUniqueId(
          uniqueId,
          channel: Common.channel,
        );

  /// Returns the [SurfaceTexture] that receives image data to display.
  @Method()
  Future<SurfaceTexture> getSurfaceTexture() =>
      invoke<SurfaceTexture>(Common.channel, [$getSurfaceTexture()],
          genericHelper: _GenericHelper.instance);
}

/// Configuration for a [Preview] use case.
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['PreviewConfig']),
  ),
  androidApi: AndroidApi(21),
)
class PreviewConfig extends $PreviewConfig {
  PreviewConfig.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);
}

/// Builder for a [PreviewConfig].
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['PreviewConfig', 'Builder']),
  ),
  androidApi: AndroidApi(21),
)
class PreviewConfigBuilder extends $PreviewConfigBuilder {
  @Constructor()
  PreviewConfigBuilder() : super.$Default(channel: Common.channel);

  PreviewConfigBuilder.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  /// Sets the primary camera to be configured based on the direction the lens is facing.
  ///
  /// If multiple cameras exist with equivalent lens facing direction, the first
  /// "primary" camera for that direction will be chosen.
  @Method()
  Future<void> setLensFacing(LensFacing lensFacing) =>
      invoke<void>(Common.channel, [$setLensFacing(lensFacing)]);

  /// Builds a [PreviewConfig] from the current state.
  @Method()
  Future<PreviewConfig> build() =>
      invoke<PreviewConfig>(Common.channel, [$build()],
          genericHelper: _GenericHelper.instance);
}

/// A TextureView can be used to display a [CameraX] preview stream.
///
/// This is typically used in conjunction with the [SurfaceTexture] received
/// from [PreviewOutput].
class TextureViewWidget extends StatefulWidget {
  TextureViewWidget(this.surfaceTexture) {
    surfaceTexture.retain();
    print('create');
  }

  final SurfaceTexture surfaceTexture;

  @override
  State<StatefulWidget> createState() => _TextureViewWidgetState();
}

class _TextureViewWidgetState extends State<TextureViewWidget> {
  final String callbackId = Common.uuid.v4();
  TextureView textureView;

  @override
  void initState() {
    super.initState();
    print('init');
    PenguinPlugin.addAndroidViewCreatorCallback(callbackId, onCreateView);
  }

  @override
  void dispose() {
    super.dispose();
    textureView.release();
    widget.surfaceTexture.release();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return AndroidView(
      viewType: '${Common.channel.name}/views',
      creationParams: callbackId,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  Future<String> onCreateView(Context context) {
    print('onCreate');
    textureView = TextureView(context);
    textureView.setSurfaceTexture(widget.surfaceTexture);
    return Future<String>.value(textureView.autoReleasePool().uniqueId);
  }
}

@Class(AndroidPlatform(
  AndroidType('	android.view', <String>['TextureView']),
))
class TextureView extends $TextureView {
  @Constructor()
  TextureView(Context context)
      : super.$Default(context, channel: Common.channel);

  TextureView.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  /// Sets the source of the camera data displayed by this widget.
  @Method()
  Future<void> setSurfaceTexture(SurfaceTexture surfaceTexture) =>
      invoke<void>(Common.channel, [$setSurfaceTexture(surfaceTexture)]);
}
