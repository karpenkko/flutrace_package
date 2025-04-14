import 'package:flutter_test/flutter_test.dart';
import 'package:flutrace_package/flutrace_package.dart';

void main() {
  group('Flutrace', () {
    test('initializes correctly', () async {
      Flutrace.init(
        FlutraceConfig(
          projectToken: 'test-token',
          environment: 'test',
          defaultMetadata: {'appVersion': '1.0.0'},
          customEndpoint: Uri.parse('https://example.com/logs'),
        ),
      );
    });
  });
}
