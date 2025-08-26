package com.ceylonlab.is_device_secure

import android.app.KeyguardManager
import android.content.Context
import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** IsDeviceSecurePlugin */
class IsDeviceSecurePlugin : FlutterPlugin, MethodCallHandler {

    private lateinit var channel: MethodChannel
    private lateinit var applicationContext: Context;

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        applicationContext = flutterPluginBinding.applicationContext;
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "is_device_secure")
        channel.setMethodCallHandler(this);
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }
            "isSecure" -> {
                result.success(isDeviceSecured());
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun isDeviceSecured(): Boolean {
        val keyguardManager =
            applicationContext.getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager //api 16+
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            keyguardManager.isDeviceSecure
        } else keyguardManager.isKeyguardSecure
    }
}
