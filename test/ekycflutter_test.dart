import 'package:flutter_test/flutter_test.dart';
import 'package:ekycflutter/ekycflutter.dart';
import 'package:ekycflutter/ekycflutter_platform_interface.dart';
import 'package:ekycflutter/ekycflutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEkycflutterPlatform
    with MockPlatformInterfaceMixin
    implements EkycflutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EkycflutterPlatform initialPlatform = EkycflutterPlatform.instance;

  test('$MethodChannelEkycflutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEkycflutter>());
  });

  test('getPlatformVersion', () async {
    Ekycflutter ekycflutterPlugin = Ekycflutter();
    MockEkycflutterPlatform fakePlatform = MockEkycflutterPlatform();
    EkycflutterPlatform.instance = fakePlatform;

    expect(await ekycflutterPlugin.getPlatformVersion(), '42');
  });
}
