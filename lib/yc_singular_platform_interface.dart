import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'yc_singular_method_channel.dart';

abstract class YcSingularPlatform extends PlatformInterface {
  /// Constructs a YcSingularPlatform.
  YcSingularPlatform() : super(token: _token);

  static final Object _token = Object();

  static YcSingularPlatform _instance = MethodChannelYcSingular();

  /// The default instance of [YcSingularPlatform] to use.
  ///
  /// Defaults to [MethodChannelYcSingular].
  static YcSingularPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [YcSingularPlatform] when
  /// they register themselves.
  static set instance(YcSingularPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> initSdk({required String key, required String secret}) {
    throw UnimplementedError('initSdk() has not been implemented.');
  }

  Future<bool> sendEvent() {
    throw UnimplementedError('sendEvent() has not been implemented.');
  }

  void onDeeplink(ValueChanged<Map<String, dynamic>> onParms) {
    throw UnimplementedError('onDeeplink() has not been implemented.');
  }
}
