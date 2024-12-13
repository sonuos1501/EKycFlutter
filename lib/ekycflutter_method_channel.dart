import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ekycflutter_platform_interface.dart';

/// An implementation of [EkycflutterPlatform] that uses method channels.
class MethodChannelEkycflutter extends EkycflutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ekycflutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
