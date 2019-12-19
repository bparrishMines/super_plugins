import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:super_camera/src/interface/camera_interface.dart';
import 'package:uuid/uuid.dart';

import '../common/texture_registry.dart';
import '../../common/channel.dart';
import '../../../android.penguin.g.dart';

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
abstract class UseCase {}

/// The direction the camera faces relative to device screen.
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core.CameraX', <String>['LensFacing']),
  ),
  androidApi: AndroidApi(21),
)
class LensFacing {
  const LensFacing._(this._lensFacing);

  final $LensFacing _lensFacing;

  /// A camera on the device facing the opposite direction as the device's screen.
  @Field()
  // ignore: non_constant_identifier_names
  static final LensFacing BACK = LensFacing._($LensFacing(Uuid().v4()));

  /// A camera on the device facing the same direction as the device's screen.
  @Field()
  // ignore: non_constant_identifier_names
  static final LensFacing FRONT = LensFacing._($LensFacing(Uuid().v4()));
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
class CameraInfoX implements CameraDescription {
  CameraInfoX._({
    int sensorRotationDegrees,
    LensFacing lensFacing,
  })  : _sensorRotationDegrees = sensorRotationDegrees,
        _lensFacing = lensFacing;

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
class CameraX {
  static final CallbackHandler _callbackHandler = CallbackHandler();
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
    Channel.callbackHandler = _callbackHandler;

    if (useCase is Preview) return _bindPreview(owner, useCase);
    throw UnsupportedError('Only $Preview use case is supported');
  }

  static Future<void> _bindPreview(LifecycleOwner owner, Preview preview) {
    _allocatedWrappers
        .where(
          (Wrapper wrapper) =>
              wrapper is $PreviewOutput || wrapper is $SurfaceTexture,
        )
        .forEach(
          (Wrapper wrapper) => invoke<void>(
            Channel.channel,
            wrapper.deallocate(),
          ),
        );
    _allocatedWrappers.removeWhere(
      (Wrapper wrapper) =>
          wrapper is $PreviewOutput || wrapper is $SurfaceTexture,
    );

    final $PreviewConfigBuilder builder = $PreviewConfigBuilder(Uuid().v4());
    final $LensFacing lensFacing =
        preview._previewConfig._lensFacing._lensFacing;
    final $PreviewConfig config = $PreviewConfig(Uuid().v4());
    final $Preview $preview = $Preview(Uuid().v4());

    final $OnPreviewOutputUpdateListener updateListener =
        preview._listener?._onPreviewOutputUpdateListener;
    if (updateListener != null) _callbackHandler.addWrapper(updateListener);

    return invoke<void>(
      Channel.channel,
      builder.$PreviewConfigBuilder$Default(),
      <MethodCall>[
        if (lensFacing != null) ...[
          if (lensFacing == LensFacing.FRONT._lensFacing)
            $LensFacing.$FRONT($newUniqueId: lensFacing.uniqueId),
          if (lensFacing == LensFacing.BACK._lensFacing)
            $LensFacing.$BACK($newUniqueId: lensFacing.uniqueId),
          builder.$setLensFacing(lensFacing),
        ],
        builder.$build(config.uniqueId),
        $preview.$Preview$Default(config),
        if (updateListener != null) ...[
          updateListener.$OnPreviewOutputUpdateListener$Default(),
          $preview.$setOnPreviewOutputUpdateListener(updateListener)
        ],
        $CameraX.$bindToLifecycle(
          owner._lifecycleOwner,
          $UseCase($preview.uniqueId),
        ),
      ],
    );
  }

  /// Returns the camera info for the camera with the given lens facing.
  @Method()
  static Future<CameraInfoX> getCameraInfo(LensFacing lensFacing) async {
    final $CameraInfoX cameraInfoX = $CameraInfoX(Uuid().v4());

    final List<dynamic> result = await invokeAll(
      Channel.channel,
      <MethodCall>[
        if (lensFacing == LensFacing.BACK)
          $LensFacing.$BACK($newUniqueId: lensFacing._lensFacing.uniqueId),
        if (lensFacing == LensFacing.FRONT)
          $LensFacing.$FRONT($newUniqueId: lensFacing._lensFacing.uniqueId),
        $CameraX.$getCameraInfo(lensFacing._lensFacing, cameraInfoX.uniqueId),
        cameraInfoX.$getSensorRotationDegrees(),
      ],
    );

    return CameraInfoX._(
      sensorRotationDegrees: result[2],
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
        Channel.channel,
        wrapper.deallocate(),
      ),
    );
    _allocatedWrappers.clear();
    _callbackHandler.clearAll();
    Channel.callbackHandler = null;

    return invoke<void>(Channel.channel, $CameraX.$unbindAll());
  }
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
class LifecycleOwner {
  LifecycleOwner._();

  static final LifecycleOwner instance = LifecycleOwner._();

  final $LifecycleOwner _lifecycleOwner = $LifecycleOwner("lifecycle_owner");
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
class Preview implements UseCase {
  @Constructor()
  Preview(PreviewConfig previewConfig)
      : _previewConfig = previewConfig,
        assert(previewConfig != null);

  final PreviewConfig _previewConfig;

  OnPreviewOutputUpdateListener _listener;

  /// Sets a listener to get the [PreviewOutput] updates.
  @Method()
  void setOnPreviewOutputUpdateListener(
    OnPreviewOutputUpdateListener listener,
  ) {
    _listener = listener;
  }
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
abstract class OnPreviewOutputUpdateListener {
  @Constructor()
  OnPreviewOutputUpdateListener() {
    _onPreviewOutputUpdateListener = $OnPreviewOutputUpdateListener(
      Uuid().v4(),
      $onUpdated$Callback: ($PreviewOutput output) {
        CameraX._allocatedWrappers.add(output);
        onUpdated(PreviewOutput._(output));
        return <MethodCall>[];
      },
    );
  }

  $OnPreviewOutputUpdateListener _onPreviewOutputUpdateListener;

  /// Callback when [PreviewOutput] has been updated.
  @Method(callback: true)
  void onUpdated(PreviewOutput previewOutput);
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
class PreviewOutput {
  PreviewOutput._($PreviewOutput previewOutput) {
    invokeAll(Channel.channel, <MethodCall>[
      previewOutput.$getSurfaceTexture(_surfaceTexture.surfaceTexture.uniqueId),
      _surfaceTexture.surfaceTexture.allocate(),
    ]);
    CameraX._allocatedWrappers.add(_surfaceTexture.surfaceTexture);
  }

  final SurfaceTexture _surfaceTexture =
      SurfaceTexture.internal($SurfaceTexture(Uuid().v4()));

  /// Returns the [SurfaceTexture] that receives image data to display.
  @Method()
  SurfaceTexture getSurfaceTexture() {
    assert(
      CameraX._allocatedWrappers.contains(_surfaceTexture.surfaceTexture),
      '${Channel.deallocatedMsg(this)}. This $SurfaceTexture is no longer available.',
    );
    return _surfaceTexture;
  }
}

/// Configuration for a [Preview] use case.
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['PreviewConfig']),
  ),
  androidApi: AndroidApi(21),
)
class PreviewConfig {
  PreviewConfig._(this._lensFacing);

  final LensFacing _lensFacing;
}

/// Builder for a [PreviewConfig].
@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['PreviewConfig', 'Builder']),
  ),
  androidApi: AndroidApi(21),
)
class PreviewConfigBuilder {
  @Constructor()
  PreviewConfigBuilder();

  LensFacing _lensFacing;

  /// Sets the primary camera to be configured based on the direction the lens is facing.
  ///
  /// If multiple cameras exist with equivalent lens facing direction, the first
  /// "primary" camera for that direction will be chosen.
  @Method()
  void setLensFacing(LensFacing lensFacing) => _lensFacing = lensFacing;

  /// Builds a [PreviewConfig] from the current state.
  @Method()
  PreviewConfig build() => PreviewConfig._(_lensFacing);
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
      Uuid().v4(),
      onCreateView: ($Context context) {
        created = true;
        return <MethodCall>[
          textureView.$_TextureViewStateforCodeGen(context),
          textureView.allocate(),
          if (widget.surfaceTexture.surfaceTexture != null)
            textureView.$setSurfaceTexture(widget.surfaceTexture.surfaceTexture)
        ];
      },
    );
    CameraX._callbackHandler.addWrapper(textureView);
  }

  @override
  void dispose() {
    super.dispose();
    invoke(Channel.channel, textureView.deallocate());
    CameraX._callbackHandler.removeWrapper(textureView);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.surfaceTexture != null && created) {
      invoke(
        Channel.channel,
        textureView.$setSurfaceTexture(widget.surfaceTexture.surfaceTexture),
      );
    }
    return AndroidView(
      viewType: '${Channel.channel.name}/views',
      creationParams: textureView.uniqueId,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
