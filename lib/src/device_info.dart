import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoCollector {
  static Future<Map<String, dynamic>> collect() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      return {
        'platform': 'android',
        'model': info.model,
        'version': info.version.sdkInt,
        'manufacturer': info.manufacturer,
      };
    } else if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;
      return {
        'platform': 'ios',
        'model': info.utsname.machine,
        'systemVersion': info.systemVersion,
        'name': info.name,
      };
    }
    return {'platform': 'unknown'};
  }
}
