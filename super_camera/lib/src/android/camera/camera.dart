import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';

import '../../../penguin.g.dart';
import '../../channel.dart';

@Class(AndroidPlatform(AndroidType('android.hardware', 'Camera')))
class Camera {
  @Method()
  static Future<int> getNumberOfCameras() {
    final MethodCall call = $Camera.$getNumberOfCameras(null);
    return Channel.channel.invokeMethod(call.method, call.arguments);
  }
}