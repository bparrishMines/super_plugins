import 'package:penguin/penguin.dart';

import '../../../android.penguin.g.dart';

@Class(AndroidPlatform(
  AndroidType('android.app', <String>['Activity']),
))
class Activity {
  Activity() : activity = $Activity('activity');

  final $Activity activity;
}
