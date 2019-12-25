import 'package:flutter/services.dart';
import 'package:penguin_plugin/penguin_plugin.dart';
import 'package:uuid/uuid.dart';

/// INTERNAL ONLY CLASS
// Specifies the MethodChannel for Android and iOS. Also, specifies the message
// for a deallocated object.
class Common {
  static final Uuid uuid = Uuid();

  static const MethodChannel channel = const MethodChannel(
    'super_plugins/super_camera',
  );

  static set callbackHandler(CallbackHandler handler) {
    channel.setMethodCallHandler(handler?.methodCallHandler);
  }

  static String deallocatedMsg(dynamic object) =>
      'This `${object.runtimeType}` is no longer in memory.';
}
