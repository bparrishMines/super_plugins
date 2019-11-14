import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:super_camera/src/interface/camera_interface.dart';
import 'package:uuid/uuid.dart';

import '../common/activity.dart';
import '../common/texture_registry.dart';
import '../../common/channel.dart';
import '../../../android.penguin.g.dart';

@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core.CameraX', <String>['LensFacing']),
  ),
  androidApi: AndroidApi(21),
)
class LensFacing {
  LensFacing._(this._lensFacing);

  final $LensFacing _lensFacing;

  @Field()
  static final LensFacing BACK = LensFacing._($LensFacing(Uuid().v4()));

  @Field()
  static final LensFacing FRONT = LensFacing._($LensFacing(Uuid().v4()));
}

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

  @Method()
  int getSensorRotationDegrees() => _sensorRotationDegrees;

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

@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['CameraX']),
  ),
  androidApi: AndroidApi(21),
)
class CameraX {
  @Method()
  static Future<void> bindToLifecycle(LifecycleOwner owner, Preview preview) {
    if (PreviewOutput._allocatedPreviewOutput != null) {
      invoke(
        Channel.channel,
        PreviewOutput._allocatedPreviewOutput._previewOutput.deallocate(),
      );
      PreviewOutput._allocatedPreviewOutput = null;
    }

    final $PreviewConfigBuilder previewConfigBuilder =
        preview.previewConfig.previewConfigBuilder._previewConfigBuilder;
    final $LensFacing lensFacing =
        preview.previewConfig.previewConfigBuilder._lensFacing?._lensFacing;

    final $OnPreviewOutputUpdateListener onPreviewOutputUpdateListener =
        preview._listener._onPreviewOutputUpdateListener;
    final $PreviewConfig previewConfig = preview.previewConfig._previewConfig;
    final $Preview $preview = preview._preview;

    final CallbackHandler handler = CallbackHandler();
    handler.addWrapper(preview._listener._onPreviewOutputUpdateListener);
    Channel.callbackHandler = handler;

    return invoke<void>(
      Channel.channel,
      previewConfigBuilder.$PreviewConfigBuilder$Default(),
      <MethodCall>[
        if (lensFacing != null) ...[
          if (lensFacing == LensFacing.FRONT._lensFacing)
            $LensFacing.$FRONT($newUniqueId: lensFacing.uniqueId),
          if (lensFacing == LensFacing.BACK._lensFacing)
            $LensFacing.$BACK($newUniqueId: lensFacing.uniqueId),
          previewConfigBuilder.$setLensFacing(lensFacing),
        ],
        previewConfigBuilder.$build(previewConfig.uniqueId),
        $preview.$Preview$Default(previewConfig),
        if (preview._listener != null) ...[
          onPreviewOutputUpdateListener
              .$OnPreviewOutputUpdateListener$Default(),
          $preview.$setOnPreviewOutputUpdateListener(
            onPreviewOutputUpdateListener,
          )
        ],
        $CameraX.$bindToLifecycle(owner._lifecycleOwner, $preview),
      ],
    );
  }

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

  @Method()
  static Future<void> unbindAll() {
    Channel.callbackHandler = null;

    final $PreviewOutput tempPreviewOutput =
        PreviewOutput._allocatedPreviewOutput?._previewOutput;
    PreviewOutput._allocatedPreviewOutput = null;

    return invoke<void>(Channel.channel, $CameraX.$unbindAll(), <MethodCall>[
      if (tempPreviewOutput != null) tempPreviewOutput.deallocate(),
    ]);
  }
}

@Class(AndroidPlatform(
  AndroidType('androidx.lifecycle', <String>['LifecycleOwner']),
))
class LifecycleOwner {
  final $LifecycleOwner _lifecycleOwner = $LifecycleOwner("lifecycle_owner");
}

@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['Preview']),
  ),
  androidApi: AndroidApi(21),
)
class Preview {
  @Constructor()
  Preview(this.previewConfig);

  final PreviewConfig previewConfig;

  final $Preview _preview = $Preview(Uuid().v4());

  OnPreviewOutputUpdateListener _listener;

  @Method()
  void setOnPreviewOutputUpdateListener(
    OnPreviewOutputUpdateListener listener,
  ) {
    _listener = listener;
  }
}

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
        onUpdated(PreviewOutput._(output));
        return <MethodCall>[];
      },
    );
  }

  $OnPreviewOutputUpdateListener _onPreviewOutputUpdateListener;

  @Method(callback: true)
  void onUpdated(PreviewOutput previewOutput);
}

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
  PreviewOutput._(this._previewOutput) {
    invokeAll(Channel.channel, <MethodCall>[
      if (_allocatedPreviewOutput != null)
        _allocatedPreviewOutput._previewOutput.deallocate(),
      _previewOutput.$getSurfaceTexture(_surfaceTexture.uniqueId),
      _surfaceTexture.allocate(),
    ]);
    _allocatedPreviewOutput = this;
  }

  static PreviewOutput _allocatedPreviewOutput;

  final $PreviewOutput _previewOutput;
  final $SurfaceTexture _surfaceTexture = $SurfaceTexture(Uuid().v4());

  @Method()
  SurfaceTexture getSurfaceTexture() {
    assert(
      _allocatedPreviewOutput == this,
      '${Channel.deallocatedMsg(this)}. Another $PreviewOutput has been allocated.',
    );
    return SurfaceTexture.internal(_surfaceTexture);
  }
}

@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['PreviewConfig']),
  ),
  androidApi: AndroidApi(21),
)
class PreviewConfig {
  PreviewConfig._(this.previewConfigBuilder);

  final PreviewConfigBuilder previewConfigBuilder;

  final $PreviewConfig _previewConfig = $PreviewConfig(Uuid().v4());
}

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

  final $PreviewConfigBuilder _previewConfigBuilder =
      $PreviewConfigBuilder(Uuid().v4());

  @Method()
  void setLensFacing(LensFacing lensFacing) => _lensFacing = lensFacing;

  @Method()
  PreviewConfig build() => PreviewConfig._(this);
}

class TextureView extends StatefulWidget {
  TextureView(this.surfaceTexture);

  final SurfaceTexture surfaceTexture;

  @override
  State<StatefulWidget> createState() => _TextureViewState(Activity());
}

@Class(AndroidPlatform(
  AndroidType('	android.view', <String>['TextureView']),
))
class _TextureViewState extends State<TextureView> {
  @Constructor()
  _TextureViewState(this.activity);

  final Activity activity;
  $_TextureViewState textureView;

  @Method()
  void setSurfaceTexture(SurfaceTexture surfaceTexture) {
    // Do nothing
  }

  @override
  void initState() {
    super.initState();
    textureView = $_TextureViewState(Uuid().v4());
    invokeAll(Channel.channel, [
      textureView.$_TextureViewState$Default(activity.activity),
      textureView.allocate(),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    invoke<void>(Channel.channel, textureView.deallocate());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.surfaceTexture != null) {
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
