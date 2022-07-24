// ignore_for_file: unnecessary_null_comparison, file_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class BasicAuthInterceptor extends Interceptor {
  BasicAuthInterceptor({
    required this.clientSecret,
    required this.clientId,
  });

  final String clientSecret;
  final String clientId;

  String get basicAuth =>
      'Basic ${base64Encode(latin1.encode('$clientId:$clientSecret'))}';

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(
      <String, dynamic>{
        'Authorization': basicAuth,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log('Response: ${response.data}');
    return handler.next(response);
  }
}
