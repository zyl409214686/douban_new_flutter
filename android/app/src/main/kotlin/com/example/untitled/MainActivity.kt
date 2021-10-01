package com.example.untitled

import android.app.AlertDialog
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, "flutter.doubanmovie/buy").setMethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
            if (methodCall.method.equals("buyTicket")) {
                AlertDialog.Builder(this@MainActivity).setTitle("买票").setMessage(methodCall.arguments.toString()).create().show()
                result.success(true)
            }
            else{
                result.notImplemented();
            }
        }
    }
}
