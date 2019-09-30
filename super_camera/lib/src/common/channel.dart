import 'package:flutter/services.dart';

class Channel {
  static const MethodChannel channel = const MethodChannel(
    'super_plugins/super_camera',
  );

  static String deallocatedMsg(dynamic object) =>
      'This `${object.runtimeType}` is no longer in memory.';
}
