import 'package:flutter/foundation.dart';

import 'yc_singular_platform_interface.dart';

class YcSingular {
  Future<bool> initSDK() {
    return YcSingularPlatform.instance.initSdk(
      key: "yellow_class_ab956504",
      secret: "f4753d12ca02c61812fe625a4f8572e7",
    );
  }

  Future<bool> sendEvent() {
    return YcSingularPlatform.instance.sendEvent();
  }

  void onDeeplink(ValueChanged<Map<String, dynamic>> onParms) {
    YcSingularPlatform.instance.onDeeplink(onParms);
  }
}
