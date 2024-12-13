import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ekycflutter_method_channel.dart';

abstract class EkycflutterPlatform extends PlatformInterface {
  /// Constructs a EkycflutterPlatform.
  EkycflutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static EkycflutterPlatform _instance = MethodChannelEkycflutter();

  /// The default instance of [EkycflutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelEkycflutter].
  static EkycflutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EkycflutterPlatform] when
  /// they register themselves.
  static set instance(EkycflutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
