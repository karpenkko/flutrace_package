import 'package:fimber/fimber.dart';
import 'config.dart';
import 'device_info.dart';
import 'sender.dart';

class Flutrace{
  static FlutraceConfig? _config;
  static Map<String, dynamic>? _deviceInfo;

  static void init(FlutraceConfig config) async {
    _config = config;
    Fimber.plantTree(DebugTree());
    _deviceInfo = await DeviceInfoCollector.collect();
  }

  static void log(
      String message, {
        String level = 'info',
        String? errorName,
        String? errorCode,
        Map<String, dynamic>? customMetadata,
      }) {
    if (_config == null) return;

    switch (level) {
      case 'error':
        Fimber.e(message);
        break;
      case 'debug':
        Fimber.d(message);
        break;
      case 'warning':
        Fimber.w(message);
        break;
      default:
        Fimber.i(message);
    }

    final payload = {
      'message': message,
      'level': level,
      'timestamp': DateTime.now().toIso8601String(),
      'token': _config!.projectToken,
      'environment': _config!.environment,
      'device': _deviceInfo,
      'error': {
        'name': errorName,
        'code': errorCode,
      },
      'custom': {
        ...?_config!.defaultMetadata,
        ...?customMetadata,
      },
    };

    final endpoint = _config!.customEndpoint ??
        Uri.parse('http://10.0.2.2:8000/logs');

    LogSender.send(endpoint: endpoint, payload: payload);
  }
}
