import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:paypal_flutter/paypal_flutter.dart';
import 'package:paypal_flutter/src/interceptor/api_interceptor.dart';
import 'package:paypal_flutter/src/interceptor/basic_auth_interceptor.dart';

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

  Future<AccessToken> getAccessToken() async {
    try {
      _dio.interceptors.add(
        BasicAuthInterceptor(
          clientId: clientId,
          clientSecret: clientSecret,
        ),
      );
      final response = await _dio.post(
        '/v1/oauth2/token',
        queryParameters: {
          'grant_type': 'client_credentials',
        },
        options: Options(),
      );
      if (response.statusCode == 200) {
        return AccessToken.fromJson(response.data as Map<String, dynamic>);
      } else {
        return AccessToken(
          status: Status.error,
          message: response.data['error_description'] as String,
        );
      }
    } on DioError catch (e) {
      print(e.response);
      return AccessToken(
        status: Status.error,
        message: 'An error occur, Try again',
      );
    }
  }

  Future<void> createOrder({
    required String accessToken,
    required Order order,
  }) async {
    try {
      _dio.interceptors.add(
        ApiInterceptor(
          accessToken: accessToken,
        ),
      );
      final response = await _dio.post(
        '/v2/checkout/orders',
        data: order.toJson(),
      );

      print(response.data);

      if (response.statusCode == 201) {
        print(response.data);
        // return Order.fromJson(response.data as Map<String, dynamic>);
      } else {
        // return Order(
        //   status: Status.error,
        //   message: 'error',
        // );
      }
    } on DioError catch (e) {
      print(e);
      // return Order(
      //   status: Status.error,
      //   message: 'error',
      // );
    }
  }
}
