import 'package:dio/dio.dart';
import 'package:ecommerce_crud_operation/app/core/config/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ConfiguredDio {
  late final Dio dio;
  final String token;

  ConfiguredDio(this.token) {
    dio = Dio(BaseOptions(baseUrl: ConfigConstants.apiPath, headers: {
      'Content-Type': 'application/json',
      'connection': 'keep-alive',
      ...getTokenHeader(token)
    }));

    dio.interceptors.add(PrettyDioLogger());

    dio.interceptors.add(InterceptorsWrapper(onRequest: (
      RequestOptions options,
      RequestInterceptorHandler handler,
    ) {
      print('onRequest: ${options.data}');
      return handler.next(options);
    }, onResponse: (
      Response e,
      ResponseInterceptorHandler handler,
    ) {
      print('Response: ${e.data}');
      return handler.next(e);
    }, onError: (DioError e, ErrorInterceptorHandler handler) {
      print('DioError: ${e.response?.statusCode}');
      handler.next(e);
    }));
  }

  Map<String, String> getTokenHeader(String token) => {
        'Authorization': 'Bearer $token',
      };

  void updateToken(String token) {
    dio.options.headers = getTokenHeader(token);
  }
}
