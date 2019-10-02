import 'package:flutter/services.dart';

/// INTERNAL ONLY CLASS
// Specifies the MethodChannel for Android and iOS. Also, specifies the message
// for a deallocated object.
class Channel {
  static const MethodChannel channel = const MethodChannel(
    'super_plugins/super_camera',
  );

  static String deallocatedMsg(dynamic object) =>
      'This `${object.runtimeType}` is no longer in memory.';
}
