// ignore_for_file: unnecessary_null_comparison, file_names

import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor({
    required this.accessToken,
  });

  final String accessToken;

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(
      <String, dynamic>{
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
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
