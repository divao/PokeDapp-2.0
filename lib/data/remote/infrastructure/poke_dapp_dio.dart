import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:domain/exceptions.dart';

class PokeDappDio extends DioForNative {
  PokeDappDio({
    BaseOptions? options,
  }) : super(options);

  @override
  Future<Response<T>> request<T>(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        Options? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) =>
      super
          .request<T>(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onReceiveProgress,
        queryParameters: queryParameters,
      )
          .catchError(
            (error) {
          if (error is DioException && error.error is SocketException) {
            throw NoConnectionException();
          } else if (error is DioException && error.type == DioExceptionType.connectionTimeout) {
            throw ConnectionTimedOutException();
          }
          if (error is Exception) throw error;

          throw UnexpectedException();
        },
      );
}