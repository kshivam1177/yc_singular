import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'yc_singular_platform_interface.dart';

/// An implementation of [YcSingularPlatform] that uses method channels.

class MethodChannelYcSingular extends YcSingularPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.yellowclass/yc_singular');
  bool _isFirstInit = true;

  @override
  Future<bool> initSdk({required String key, required String secret}) async {
    if (!_isFirstInit) {
      return true;
    }
    final response = await methodChannel.invokeMethod<bool>(
      'initSdk',
      {"key": key, "secret": secret},
    );
    if (response == true) {
      _isFirstInit = false;
    }
    return response ?? false;
  }

  @override
  Future<bool> sendEvent() async {
    final response = await methodChannel.invokeMethod<bool>(
      'sendEvent',
      {"parm1": "val1", "parm2": "val2"},
    );
    return response ?? false;
  }

  @override
  void onDeeplink(ValueChanged<Map<String, dynamic>> onParms) {
    methodChannel.setMethodCallHandler((call) {
      onParms.call(Map<String, dynamic>.of(call.arguments));
      return call.arguments;
    });
  }
}
