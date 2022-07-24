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
    required this.clientSecret,
  }) : _dio = (dio ?? Dio())..options.baseUrl = sandBoxBaseUrl;

  final Dio _dio;
  final bool isSandbox;
  final String clientId;
  final String clientSecret;

  @visibleForTesting
  static String sandBoxBaseUrl = 'https://api.sandbox.paypal.com';

  @visibleForTesting
  static String liveBaseUrl = 'https://api.paypal.com';

  String get _getBaseUrl => isSandbox ? sandBoxBaseUrl : liveBaseUrl;

  String get basicAuth =>
      'Basic ${base64Encode(latin1.encode('$clientId:$clientSecret'))}';

  Future<void> getAccessToken() async {
    try {
      print(basicAuth);
      final response = await _dio.post(
        '/v1/oauth2/token',
        queryParameters: {
          'grant_type': 'client_credentials',
        },
        options: Options(
          headers: {
            'Authorization': basicAuth.trim(),
          },
        ),
      );
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
