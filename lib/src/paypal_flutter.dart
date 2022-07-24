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
  }) : _dio = dio ?? Dio();

  final Dio _dio;
  final bool isSandbox;

  @visibleForTesting
  static String sandBoxBaseUrl = 'https://api.sandbox.paypal.com';

  @visibleForTesting
  static String liveBaseUrl = 'https://api.paypal.com';

  String get _getBaseUrl => isSandbox ? sandBoxBaseUrl : liveBaseUrl;

  Future<void> getAccessToken() async {
    try {
      final response = await _dio.get(
        '$_getBaseUrl/v1/oauth2/token',
        queryParameters: {
          'grant_type': 'client_credentials',
        },
      );
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
