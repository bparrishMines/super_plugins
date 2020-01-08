import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:penguin_plugin/android_wrapper.dart';
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
abstract class UseCase {
  static FutureOr onAllocated($UseCase wrapper) => throw UnimplementedError();
}

/// The direction the camera faces relative to device screen.
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core.CameraX', <String>['LensFacing']),
  ),
  androidApi: AndroidApi(21),
)
class LensFacing extends $LensFacing {
  LensFacing._(String uniqueId, LensDirection lensDirection) : super(uniqueId) {
    invoke<void>(Common.channel, [
      if (lensDirection == LensDirection.back)
        $LensFacing.$BACK($newUniqueId: uniqueId),
      if (lensDirection == LensDirection.front)
        $LensFacing.$FRONT($newUniqueId: uniqueId),
      $LensFacing(uniqueId).allocate(),
    ]);
  }

  /// A camera on the device facing the opposite direction as the device's screen.
  @Field()
  // ignore: non_constant_identifier_names
  static final LensFacing BACK =
      LensFacing._(Common.uuid.v4(), LensDirection.back);

  /// A camera on the device facing the same direction as the device's screen.
  @Field()
  // ignore: non_constant_identifier_names
  static final LensFacing FRONT =
      LensFacing._(Common.uuid.v4(), LensDirection.front);

  static FutureOr onAllocated($LensFacing wrapper) =>
      throw UnimplementedError();
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
class CameraInfoX extends $CameraInfoX implements CameraDescription {
  CameraInfoX._({
    String uniqueId,
    int sensorRotationDegrees,
    LensFacing lensFacing,
  })  : _sensorRotationDegrees = sensorRotationDegrees,
        _lensFacing = lensFacing,
        super(uniqueId);

  final int _sensorRotationDegrees;
  final LensFacing _lensFacing;

  /// Returns the sensor rotation, in degrees, relative to the device's "natural" rotation.
  @Method()
  int getSensorRotationDegrees() => _sensorRotationDegrees;

  /// The direction the camera faces relative to device screen.
  LensFacing getLensFacing() => _lensFacing;

  @override
  LensDirection get direction {
    if (_lensFacing == LensFacing.FRONT) return LensDirection.front;
    if (_lensFacing == LensFacing.BACK) return LensDirection.back;
    throw StateError('No direction for $LensFacing');
  }

  @override
  String get name {
    if (_lensFacing == LensFacing.FRONT) return 'FRONT';
    if (_lensFacing == LensFacing.BACK) return 'BACK';
    throw StateError('No name for $LensFacing');
  }

  static FutureOr<CameraInfoX> onAllocated($CameraInfoX wrapper) =>
      throw UnimplementedError();
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
  CameraX._() : super(null);

  static final CallbackHandler _callbackHandler = AndroidCallbackHandler();
  static final List<Wrapper> _allocatedWrappers = <Wrapper>[];

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
  static Future<void> bindToLifecycle(LifecycleOwner owner, UseCase useCase) {
    Common.callbackHandler = _callbackHandler;
    if (useCase is Preview) return _bindPreview(owner, useCase);
    throw UnsupportedError('Only $Preview use case is supported.');
  }

  static Future<void> _bindPreview(LifecycleOwner owner, Preview preview) {
    _allocatedWrappers.removeWhere((Wrapper wrapper) {
      if (wrapper is PreviewOutput || wrapper is SurfaceTexture) {
        invoke<void>(Common.channel, [wrapper.deallocate()]);
        return true;
      }

      return false;
    });

    if (preview._listener != null) {
      _callbackHandler.addWrapper(preview._listener);
    }

    return invoke<void>(
      Common.channel,
      <MethodCall>[
        ...preview.methodCallStorageHelper.methodCalls,
        $CameraX.$bindToLifecycle(owner, preview),
      ],
    );
  }

  /// Returns the camera info for the camera with the given lens facing.
  @Method()
  static Future<CameraInfoX> getCameraInfo(LensFacing lensFacing) async {
    final $CameraInfoX cameraInfoX = $CameraInfoX(Common.uuid.v4());

    final List<dynamic> result = await invokeForAll(
      Common.channel,
      <MethodCall>[
        $CameraX.$getCameraInfo(lensFacing, cameraInfoX.uniqueId),
        cameraInfoX.$getSensorRotationDegrees(),
      ],
    );

    return CameraInfoX._(
      uniqueId: cameraInfoX.uniqueId,
      sensorRotationDegrees: result[1],
      lensFacing: lensFacing,
    );
  }

  /// Unbinds all use cases from the lifecycle and removes them from CameraX.
  ///
  /// This will initiate a close of every currently open camera.
  @Method()
  static Future<void> unbindAll() {
    _allocatedWrappers.forEach(
      (Wrapper wrapper) => invoke<void>(
        Common.channel,
        [wrapper.deallocate()],
      ),
    );
    _allocatedWrappers.clear();
    _callbackHandler.clearAll();

    return invoke<void>(Common.channel, [$CameraX.$unbindAll()]);
  }

  static FutureOr onAllocated($CameraX cameraX) => throw UnimplementedError();
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
  LifecycleOwner._() : super('lifecycle_owner');

  static final LifecycleOwner instance = LifecycleOwner._();

  static FutureOr onAllocated($LifecycleOwner owner) =>
      throw UnimplementedError();
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
/// attaching the SurfaceTexture to [TextureView].
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
      : assert(previewConfig != null),
        super(Common.uuid.v4()) {
    methodCallStorageHelper
        .storeAll(previewConfig.methodCallStorageHelper.methodCalls);
    methodCallStorageHelper.store($Preview$Default(previewConfig));
  }

  OnPreviewOutputUpdateListener _listener;

  /// Sets a listener to get the [PreviewOutput] updates.
  @Method()
  void setOnPreviewOutputUpdateListener(
    OnPreviewOutputUpdateListener listener,
  ) {
    methodCallStorageHelper.replaceAll([
      ...listener.methodCallStorageHelper.methodCalls,
      $setOnPreviewOutputUpdateListener(listener),
    ]);
    _listener = listener;
  }

  static FutureOr onAllocated($Preview wrapper) => throw UnimplementedError();
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
abstract class OnPreviewOutputUpdateListener
    extends $OnPreviewOutputUpdateListener {
  @Constructor()
  OnPreviewOutputUpdateListener() : super(Common.uuid.v4()) {
    methodCallStorageHelper.store($OnPreviewOutputUpdateListener$Default());
  }

  /// Callback when [PreviewOutput] has been updated.
  @Method(callback: true)
  void onUpdated(PreviewOutput previewOutput);

  static FutureOr onAllocated($OnPreviewOutputUpdateListener listener) =>
      throw UnimplementedError();
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
  PreviewOutput._(String uniqueId, this._surfaceTexture) : super(uniqueId);

  final SurfaceTexture _surfaceTexture;

  /// Returns the [SurfaceTexture] that receives image data to display.
  @Method()
  SurfaceTexture getSurfaceTexture() {
    assert(
      CameraX._allocatedWrappers.contains(_surfaceTexture),
      '${Common.deallocatedMsg(this)}. This $SurfaceTexture is no longer available.',
    );
    return _surfaceTexture;
  }

  static FutureOr<PreviewOutput> onAllocated($PreviewOutput output) {
    final $SurfaceTexture surfaceTexture = $SurfaceTexture(Common.uuid.v4());

    invoke<void>(Common.channel, <MethodCall>[
      output.$getSurfaceTexture(surfaceTexture.uniqueId),
      surfaceTexture.allocate(),
      output.deallocate(),
    ]);

    final SurfaceTexture surfaceTextureObj =
        SurfaceTexture.onAllocated(surfaceTexture);
    CameraX._allocatedWrappers.add(surfaceTextureObj);

    return PreviewOutput._(output.uniqueId, surfaceTextureObj);
  }
}

/// Configuration for a [Preview] use case.
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['PreviewConfig']),
  ),
  androidApi: AndroidApi(21),
)
class PreviewConfig extends $PreviewConfig {
  PreviewConfig._(String uniqueId, Iterable<MethodCall> methodCalls)
      : super(uniqueId) {
    methodCallStorageHelper.storeAll(methodCalls);
  }

  static FutureOr onAllocated($PreviewConfig config) =>
      throw UnimplementedError();
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
  PreviewConfigBuilder() : super(Common.uuid.v4()) {
    methodCallStorageHelper.store($PreviewConfigBuilder$Default());
  }

  /// Sets the primary camera to be configured based on the direction the lens is facing.
  ///
  /// If multiple cameras exist with equivalent lens facing direction, the first
  /// "primary" camera for that direction will be chosen.
  @Method()
  void setLensFacing(LensFacing lensFacing) {
    methodCallStorageHelper.replace($setLensFacing(lensFacing));
  }

  /// Builds a [PreviewConfig] from the current state.
  @Method()
  PreviewConfig build() {
    final String previewConfigId = Common.uuid.v4();
    return PreviewConfig._(previewConfigId, [
      ...methodCallStorageHelper.methodCalls,
      $build(previewConfigId),
    ]);
  }

  static FutureOr onAllocated($PreviewConfigBuilder builder) =>
      throw UnimplementedError();
}

/// A TextureView can be used to display a [CameraX] preview stream.
///
/// This is typically used in conjunction with the [SurfaceTexture] received
/// from [PreviewOutput].
class TextureView extends StatefulWidget {
  TextureView(this.surfaceTexture);

  /// The source of the camera data displayed by this widget.
  final SurfaceTexture surfaceTexture;

  @override
  State<StatefulWidget> createState() => _TextureViewState();
}

@Class(AndroidPlatform(
  AndroidType('	android.view', <String>['TextureView']),
))
class _TextureViewState extends State<TextureView> {
  _TextureViewState();

  @Constructor()
  _TextureViewState.forCodeGen(Context context);

  $_TextureViewState textureView;

  bool created = false;

  @Method()
  void setSurfaceTexture(SurfaceTexture surfaceTexture) {
    // Do nothing
  }

  @override
  void initState() {
    super.initState();
    textureView = $_TextureViewState(
      Common.uuid.v4(),
      onCreateView: (Context context) {
        created = true;

        return <MethodCall>[
          textureView.$_TextureViewStateforCodeGen(context),
          textureView.allocate(),
          if (widget.surfaceTexture != null)
            textureView.$setSurfaceTexture(widget.surfaceTexture)
        ];


      },
    );


    CameraX._callbackHandler.addWrapper(textureView);
  }

  @override
  void dispose() {
    super.dispose();
    invoke(Common.channel, [textureView.deallocate()]);
    CameraX._callbackHandler.removeWrapper(textureView);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.surfaceTexture != null && created) {
      invoke(
        Common.channel,
        [textureView.$setSurfaceTexture(widget.surfaceTexture)],
      );
    }
    return AndroidView(
      viewType: '${Common.channel.name}/views',
      creationParams: textureView.uniqueId,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  static FutureOr onAllocated($_TextureViewState wrapper) =>
      throw UnimplementedError();
}
