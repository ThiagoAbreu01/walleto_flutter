import 'package:dio/dio.dart';
import 'package:walleto_flutter/app/core/helpers/constants.dart';

import 'package:walleto_flutter/app/core/local_storage/secure_storage/secure_local_storage.dart';
import 'package:walleto_flutter/app/core/logger/logger.dart';

class AuthInterceptor extends Interceptor {
  SecureLocalStorage secureLocalStorage;
  Logger log;
  AuthInterceptor({
    required this.secureLocalStorage,
    required this.log,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authRequired =
        options.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] ?? false;

    if (authRequired) {
      final accessToken = await secureLocalStorage
          .read(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY);

      if (accessToken == null) {
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Expire Token',
            type: DioExceptionType.cancel,
          ),
        );
      }

      options.headers['Authorization'] = accessToken;
    } else {
      options.headers.remove('Authorization');
    }

    handler.next(options);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   super.onError(err, handler);
  // }
}
