import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:uuid/uuid.dart';

import '../common/activity.dart';
import '../common/texture_registry.dart';
import '../../common/channel.dart';
import '../../../android.penguin.g.dart';

@Class(
  AndroidPlatform(
    AndroidType('androidx.camera.core', <String>['CameraX']),
  ),
  androidApi: AndroidApi(21),
)
class CameraX {
  @Method()
  static void bindToLifecycle(LifecycleOwner owner, Preview preview) {
    final $PreviewConfigBuilder previewConfigBuilder =
        preview.previewConfig.previewConfigBuilder._previewConfigBuilder;
    final $PreviewConfig previewConfig = preview.previewConfig._previewConfig;
    final $Preview $preview = preview._preview;

    final CallbackHandler handler = CallbackHandler();
    handler.addWrapper(preview._listener._onPreviewOutputUpdateListener);
    Channel.callbackHandler = handler;

    invokeAll(Channel.channel, <MethodCall>[
      previewConfigBuilder.$PreviewConfigBuilder$Default(),
      previewConfigBuilder.$build(previewConfig.uniqueId),
      $preview.$Preview$Default(previewConfig),
      if (preview._listener != null)
        $preview.$setOnPreviewOutputUpdateListener(
          preview._listener._onPreviewOutputUpdateListener,
        ),
      $CameraX.$bindToLifecycle(owner._lifecycleOwner, $preview),
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
  Future<void> onUpdated(PreviewOutput previewOutput);
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
  PreviewOutput._(this._previewOutput);

  final $PreviewOutput _previewOutput;

  @Method()
  SurfaceTexture getSurfaceTexture() {

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

  final $PreviewConfigBuilder _previewConfigBuilder =
      $PreviewConfigBuilder(Uuid().v4());

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
    textureView = $_TextureViewState(widget.key.toString());
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
      textureView.$setSurfaceTexture(widget.surfaceTexture.surfaceTexture);
    }
    return AndroidView(
      viewType: '${Channel.channel.name}/views',
      creationParams: textureView.uniqueId,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
