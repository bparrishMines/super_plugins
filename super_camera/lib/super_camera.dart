
import 'dart:async';

import 'package:flutter/services.dart';

class SuperCamera {
  static const MethodChannel _channel =
      const MethodChannel('super_camera');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
