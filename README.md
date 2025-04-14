# flutrace_package

A lightweight Flutter logging package for structured event tracking with custom metadata.  
Useful for debugging, staging, and production environments.

## Features

- Easy initialization with project config
- Log messages with severity levels: info, warning, error, etc.
- Attach custom metadata to every log
- Support for environment separation (e.g., dev/staging/production)
- Console-based output (can be extended)

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutrace_package: ^1.0.0
```

## Usage

```dart
import 'package:flutrace_package/flutrace_package.dart';

void main() {
  Flutrace.init(
    FlutraceConfig(
      projectToken: '1234-abc',
      environment: 'staging',
      isProduction: false,
      defaultMetadata: {
        'appVersion': '1.0.0',
      },
    ),
  );

  Flutrace.log(
    'User signed in',
    level: 'info',
    customMetadata: {
      'userId': 'xyz-123',
      'country': 'UA',
    },
  );

  Flutrace.log(
    'Invalid login',
    level: 'error',
    errorName: 'LoginException',
    errorCode: '401',
    customMetadata: {
      'username': 'test_user',
    },
  );
}
```

## FlutraceConfig Options

| Field             | Type                   | Required | Description                                                                     |
|-------------------|------------------------|----------|---------------------------------------------------------------------------------|
| `projectToken`    | `String`               | ✅ Yes    | Unique identifier for your app/project.                                         |
| `environment`     | `String`               | ✅ Yes    | Specifies the current environment (e.g. `"production"`, `"staging"`, `"dev"`).  |
| `isProduction`    | `bool`                 | ✅ Yes    | Indicates whether this is a production environment.                             |
| `defaultMetadata` | `Map<String, dynamic>` | ❌ No     | Optional metadata included with all logs. Example: `{ "appVersion": "1.0.0" }`. |

projectToken automatically generated on the [Flutrace website](https://flutrace.dev) after creating a project — just copy and paste it.

## Contributing

Contributions are welcome!
Feel free to open issues or submit pull requests.

## License

This package is licensed under the MIT License.