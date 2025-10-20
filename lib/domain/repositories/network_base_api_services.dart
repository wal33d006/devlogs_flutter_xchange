import 'package:devlogs_flutter_xchange/domain/failures/network_failure.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

abstract class NetworkBaseApiService {
  Future<Either<NetworkFailure, T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  });

  Future<Either<NetworkFailure, T>> post<T>({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  });

  Future<Either<NetworkFailure, T>> patch<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  });

  Future<Either<NetworkFailure, T>> put<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  });

  Future<Either<NetworkFailure, T>> delete<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  });

  Future<Either<NetworkFailure, T>> upload<T>({
    required String url,
    required String filePath,
    required String fileName,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  });
}
