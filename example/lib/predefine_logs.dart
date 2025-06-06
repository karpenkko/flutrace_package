final List<Map<String, dynamic>> predefinedLogs = [
  {
    'message': 'Invalid login',
    'level': 'error',
    'device': {
      'platform': 'ios',
      'model': 'iPhone 14',
      'version': '16',
      'manufacturer': 'Apple',
      'systemVersion': '16.2',
      'name': 'iPhone',
    },
    'errorName': 'LoginException',
    'errorCode': '401',
    'customMetadata': {
      'username': 'test_user',
      'country': 'Germany',
    },
  },
  {
    'message': 'User signed in',
    'level': 'info',
    'device': {
      'platform': 'android',
      'model': 'Pixel 6',
      'version': '13',
      'manufacturer': 'Google',
      'systemVersion': '13',
      'name': 'Pixel',
    },
    'errorName': '',
    'errorCode': '',
    'customMetadata': {
      'userId': 'abc123',
      'country': 'Ukraine',
    },
  },
  {
    'message': 'File upload failed',
    'level': 'error',
    'device': {
      'platform': 'android',
      'model': 'OnePlus 9',
      'version': '11',
      'manufacturer': 'OnePlus',
      'systemVersion': '11',
      'name': 'OnePlus',
    },
    'errorName': 'UploadError',
    'errorCode': 'E413',
    'customMetadata': {
      'fileSize': '12MB',
      'country': 'France',
    },
  },
  {
    'message': 'Crash on profile screen',
    'level': 'critical',
    'device': {
      'platform': 'android',
      'model': 'Samsung S21',
      'version': '12',
      'manufacturer': 'Samsung',
      'systemVersion': '12',
      'name': 'Galaxy',
    },
    'errorName': 'NullPointerException',
    'errorCode': 'E500',
    'customMetadata': {
      'screen': 'profile',
      'country': 'USA',
    },
  },
  {
    'message': 'Server timeout',
    'level': 'error',
    'device': {
      'platform': 'web',
      'model': 'Chrome',
      'version': '120',
      'manufacturer': 'Google',
      'systemVersion': '120',
      'name': 'Chrome',
    },
    'errorName': 'TimeoutError',
    'errorCode': '504',
    'customMetadata': {
      'endpoint': '/api/data',
      'country': 'Poland',
    },
  },
];