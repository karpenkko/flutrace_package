import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LogSender {
  static Future<void> send({
    required Uri endpoint,
    required Map<String, dynamic> payload,
  }) async {
    try {
      await http.post(
        endpoint,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error sending log: $e');
      }
    }
  }
}
