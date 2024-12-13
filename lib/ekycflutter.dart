
import 'ekycflutter_platform_interface.dart';

class Ekycflutter {
  Future<String?> getPlatformVersion() {
    return EkycflutterPlatform.instance.getPlatformVersion();
  }
}
