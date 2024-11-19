import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:procraft/src/app/shared/http/client/logger_interceptor.dart';

class ProcraftDioClient with DioMixin implements Dio {
  @override
  BaseOptions get options => BaseOptions(
        baseUrl: 'https://procraftapi.up.railway.app/api',
        connectTimeout: const Duration(seconds: 10),
      );

  @override
  HttpClientAdapter get httpClientAdapter => IOHttpClientAdapter();

  final List<Interceptor> requestInterceptors;

  ProcraftDioClient({this.requestInterceptors = const <Interceptor>[]}) {
    interceptors.addAll([
      LoggerInterceptor(),
      ...interceptors,
    ]);
  }
}
