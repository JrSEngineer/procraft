import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestJson = json.encode(options.data);
    log(
      '''
          PATH: ${options.path},
          REQUEST_BODY: $requestJson,
          HEADERS: ${options.headers}
      ''',
    );

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorJson = json.encode({'message': err.message});

    log(
      '''
        ERROR :$errorJson
      ''',
      error: err.error,
    );

    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final responseJson = json.encode(response.data);
    log(
      '''
        RESPONSE_BODY: $responseJson
      ''',
    );

    super.onResponse(response, handler);
  }
}
