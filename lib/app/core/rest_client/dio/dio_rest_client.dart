import 'package:walleto_flutter/app/core/config/env/env.dart';
import 'package:walleto_flutter/app/core/helpers/constants.dart';
import 'package:walleto_flutter/app/core/local_storage/secure_storage/secure_local_storage.dart';
import 'package:walleto_flutter/app/core/logger/logger.dart';
import 'package:walleto_flutter/app/core/rest_client/dio/interceptors/auth_interceptor.dart';
import 'package:walleto_flutter/app/core/rest_client/rest_client_exception.dart';
import 'package:dio/dio.dart';

import 'package:walleto_flutter/app/core/rest_client/rest_client.dart';
import 'package:walleto_flutter/app/core/rest_client/rest_client_response.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;
  final Logger log;
  final SecureLocalStorage secureLocalStorage;
  final _defaultOptions = BaseOptions(
    baseUrl: Env.i[Constants.ENV_BASE_URL_KEY] ?? '',
    connectTimeout: Duration(
      milliseconds: int.parse(Env.i['rest_client_connect_timeout']!),
    ), // ENV_REST_CLIENT_CONNECT_TIMEOUT_KEY
    receiveTimeout: Duration(
      milliseconds: int.parse(Env.i['rest_client_receive_timeout']!),
    ), // ENV_REST_CLIENT_RECEIVE_TIMEOUT_KEY
  );

  DioRestClient(
      {BaseOptions? baseOptions,
      required this.log,
      required this.secureLocalStorage}) {
    _dio = Dio(baseOptions ?? _defaultOptions);

    _dio.interceptors.addAll(
      [
        AuthInterceptor(secureLocalStorage: secureLocalStorage, log: log),
        LogInterceptor(
            request: false,
            requestHeader: false,
            requestBody: false,
            responseHeader: false,
            responseBody: false,
            error: false,
            logPrint: (object) {}),
      ],
    );
  }

  @override
  RestClient auth() {
    _defaultOptions.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultOptions.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(
        '${_defaultOptions.baseUrl}/$path',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        '${_defaultOptions.baseUrl}/$path',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        '${_defaultOptions.baseUrl}/$path',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      // log.info('INFO:::::: ${_dio.options.baseUrl}');
      final response = await _dio.post(
        '${_defaultOptions.baseUrl}/$path',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        '${_defaultOptions.baseUrl}/$path',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {required String method,
      data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(
        '${_defaultOptions.baseUrl}/$path',
        queryParameters: queryParameters,
        options: Options(headers: headers, method: method),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(
      Response<dynamic> response) async {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _throwRestClientException(DioException dioException) {
    final response = dioException.response;
    throw RestClientException(
      message: response?.statusMessage,
      statusCode: response?.statusCode,
      error: dioException.error,
      response: RestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
  }
}
