package com.son.ekycflutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** EkycflutterPlugin */
class EkycflutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity

  companion object {
    private var instance: EkycflutterPlugin? = null
    const val KEY_SEND_EVENT: String = "KEY_SEND_EVENT"

    fun getInstance(): EkycflutterPlugin {
        return instance ?: throw IllegalStateException("EkycflutterPlugin is not initialized")
    }
  }

  public mEvent: EventChanel.EventSink? = null
  public mainCallBack: OnMai

  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    instance = this
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ekycflutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    instance = null
  }

  fun sendEvent(map: HashMap<String, String>) {
    mainCallBack?.doAction(KEY_SEND_EVENT, map)
  }


  interface OnMainCallBack {
    fun doAction(key: String, data: Any)
  }

}
