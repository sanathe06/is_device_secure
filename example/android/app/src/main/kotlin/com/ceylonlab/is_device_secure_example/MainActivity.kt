package com.ceylonlab.is_device_secure_example

import android.app.KeyguardManager
import android.content.Context
import android.os.Build
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {
    private fun isDeviceSecured(): Boolean {
        val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager //api 16+
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            keyguardManager.isDeviceSecure
        } else keyguardManager.isKeyguardSecure
    }
}
