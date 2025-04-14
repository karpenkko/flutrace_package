import 'package:flutrace_package/flutrace_package.dart';

void main() async {
  Flutrace.init(
    FlutraceConfig(
      projectToken: '1234-abc',
      environment: 'staging',
      isProduction: false,
      defaultMetadata: {'appVersion': '1.0.0'},
    ),
  );

  Flutrace.log(
    'User signed in',
    level: 'info',
    customMetadata: {'userId': 'xyz-123', 'country': 'UA'},
  );

  Flutrace.log(
    'Invalid login',
    level: 'error',
    errorName: 'LoginException',
    errorCode: '401',
    customMetadata: {'username': 'test_user'},
  );
}
