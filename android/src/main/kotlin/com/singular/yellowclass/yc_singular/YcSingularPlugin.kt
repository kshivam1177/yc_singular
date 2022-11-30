package com.singular.yellowclass.yc_singular

import android.app.Activity
import android.os.Bundle
import com.singular.sdk.SingularConfig
import com.singular.sdk.SingularLinkHandler
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result

class YcSingularPlugin : ContextAwareFlutterPlugin() {

    lateinit var _helper: YcSingularHelper

    override val pluginName: String get() = "com.yellowclass/yc_singular"

    override fun onMethodCall(call: MethodCall, result: Result) {

        _helper = YcSingularHelper(call = call, result = result, channel = channel)

        when (call.method) {
            "initSdk" -> {
                applicationContext?.let { _helper.initSDK(context = it) }
                result.success(true)
            }
            "sendEvent" -> {
                _helper.sendEvent()
                result.success(true)
            }

        }

    }

    override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {}

    override fun onActivityStarted(activity: Activity) {}

    override fun onActivityResumed(activity: Activity) {}

    override fun onActivityPaused(activity: Activity) {}

    override fun onActivityStopped(activity: Activity) {}

    override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {}

    override fun onActivityDestroyed(activity: Activity) {}

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
