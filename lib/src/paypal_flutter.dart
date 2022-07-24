import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// {@template paypal_flutter}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class PaypalFlutter {
  /// {@macro paypal_flutter}
  PaypalFlutter({
    Dio? dio,
    this.isSandbox = true,
    required this.clientId,
    required this.secretKey,
  }) : _dio = dio ?? Dio();

  final Dio _dio;
  final bool isSandbox;
  final String clientId;
  final String secretKey;

  @visibleForTesting
  static String sandBoxBaseUrl = 'https://api.sandbox.paypal.com';

  @visibleForTesting
  static String liveBaseUrl = 'https://api.paypal.com';

  String get _getBaseUrl => isSandbox ? sandBoxBaseUrl : liveBaseUrl;

  String get basicAuth =>
      'Basic ${base64Encode(utf8.encode('$clientId:$secretKey'))}';

  Future<void> getAccessToken() async {
    try {
      final response = await _dio.post(
        '$_getBaseUrl/v1/oauth2/token',
        queryParameters: {
          'grant_type': 'client_credentials',
        },
        options: Options(
          headers: {
            'Authorization': basicAuth,
          },
        ),
      );
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
