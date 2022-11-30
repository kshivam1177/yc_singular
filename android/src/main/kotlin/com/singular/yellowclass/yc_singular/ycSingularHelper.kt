package com.singular.yellowclass.yc_singular

import android.content.Context
import com.singular.sdk.Singular
import com.singular.sdk.SingularConfig
import com.singular.sdk.SingularLinkHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class YcSingularHelper(call: MethodCall, result: MethodChannel.Result, channel: MethodChannel) {
    var call: MethodCall
    var result: MethodChannel.Result
    var channel: MethodChannel

    init {
        this.call = call
        this.result = result
        this.channel = channel
    }

    fun initSDK(context: Context) {

        val config = SingularConfig(call.argument("key"), call.argument("secret"))

//        config.ddlHandler = SingularConfig.DDLHandler()
        config.linkCallback = SingularLinkHandler {

            val deepLinkValue = mapOf(
                "deeplink" to it.deeplink,
                "isDeferred" to it.isDeferred,
                "passthrough" to it.passthrough
            )
            channel.invokeMethod("onDeeplink", deepLinkValue)
        }

        Singular.init(context, config);
    }

    fun sendEvent() {
        Singular.event(call.argument("eventName"), "NA")

    }
}
