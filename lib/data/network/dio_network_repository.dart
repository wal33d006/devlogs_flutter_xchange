import 'dart:io';

import 'package:devlogs_flutter_xchange/data/datasources/user_store.dart';
import 'package:devlogs_flutter_xchange/domain/failures/network_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/local_storage_repository.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/network_base_api_services.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'dio_config.dart';

class DioNetworkRepository implements NetworkBaseApiService {
  final UserStore _userStore;
  final LocalStorageRepository _localStorageRepository;
  late final Dio _dio;

  DioNetworkRepository(this._userStore, this._localStorageRepository) {
    _dio = DioConfig.createDio(
      userStore: _userStore,
      localStorageRepository: _localStorageRepository,
    );
  }

  @override
  Future<Either<NetworkFailure, T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) async {
    return _executeRequest<T>(
      () => _dio.get(
        url,
        queryParameters: queryParams,
        cancelToken: cancelToken,
        options: Options(headers: headers),
      ),
    );
  }

  @override
  Future<Either<NetworkFailure, T>> post<T>({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    return _executeRequest<T>(
      () => _dio.post(
        url,
        data: isFormData ? FormData.fromMap(body) : body,
        queryParameters: queryParams,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        options: Options(
          headers: headers,
          contentType: isFormData
              ? Headers.multipartFormDataContentType
              : Headers.jsonContentType,
        ),
      ),
    );
  }

  @override
  Future<Either<NetworkFailure, T>> patch<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    return _executeRequest<T>(
      () => _dio.patch(
        url,
        data: isFormData && body != null ? FormData.fromMap(body) : body,
        queryParameters: queryParams,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        options: Options(
          headers: headers,
          contentType: isFormData
              ? Headers.multipartFormDataContentType
              : Headers.jsonContentType,
        ),
      ),
    );
  }

  @override
  Future<Either<NetworkFailure, T>> put<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    return _executeRequest<T>(
      () => _dio.put(
        url,
        data: isFormData && body != null ? FormData.fromMap(body) : body,
        queryParameters: queryParams,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        options: Options(
          headers: headers,
          contentType: isFormData
              ? Headers.multipartFormDataContentType
              : Headers.jsonContentType,
        ),
      ),
    );
  }

  @override
  Future<Either<NetworkFailure, T>> delete<T>({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) async {
    return _executeRequest<T>(
      () => _dio.delete(
        url,
        data: body,
        cancelToken: cancelToken,
        options: Options(headers: headers),
      ),
    );
  }

  @override
  Future<Either<NetworkFailure, T>> upload<T>({
    required String url,
    required String filePath,
    required String fileName,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
        if (data != null) ...data,
      });

      return _executeRequest<T>(
        () => _dio.post(
          url,
          data: formData,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          options: Options(headers: headers),
        ),
      );
    } catch (e) {
      return left(
        NetworkFailure(
          error: 'File upload preparation failed: $e',
          type: NetworkFailureType.unknown,
        ),
      );
    }
  }

  /// Common method to execute requests and handle errors
  Future<Either<NetworkFailure, T>> _executeRequest<T>(
    Future<Response> Function() request,
  ) async {
    try {
      final response = await request();
      return right(response.data);
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left(
        NetworkFailure(
          error: 'Unexpected error: $e',
          type: NetworkFailureType.unknown,
        ),
      );
    }
  }

  NetworkFailure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure(
          error: 'Connection timeout. Please check your internet connection.',
          type: NetworkFailureType.connectionTimeout,
          statusCode: error.response?.statusCode,
        );

      case DioExceptionType.sendTimeout:
        return NetworkFailure(
          error: 'Send timeout. Request took too long to send.',
          type: NetworkFailureType.sendTimeout,
          statusCode: error.response?.statusCode,
        );

      case DioExceptionType.receiveTimeout:
        return NetworkFailure(
          error: 'Receive timeout. Server took too long to respond.',
          type: NetworkFailureType.receiveTimeout,
          statusCode: error.response?.statusCode,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return const NetworkFailure(
          error: 'Request was cancelled',
          type: NetworkFailureType.cancelled,
        );

      case DioExceptionType.unknown:
        return _handleUnknownError(error);

      default:
        return const NetworkFailure(
          error: 'Network error occurred',
          type: NetworkFailureType.unknown,
        );
    }
  }

  NetworkFailure _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    // Extract error message from response
    String errorMessage = 'Request failed';
    if (responseData is Map<String, dynamic>) {
      errorMessage = responseData['message'] ??
          responseData['error'] ??
          responseData['details'] ??
          errorMessage;
    }

    switch (statusCode) {
      case 400:
        return NetworkFailure(
          error: 'Bad request: $errorMessage',
          type: NetworkFailureType.badRequest,
          statusCode: statusCode,
        );
      case 401:
        return NetworkFailure(
          error: 'Unauthorized access. Please login again.',
          type: NetworkFailureType.unauthorized,
          statusCode: statusCode,
        );
      case 403:
        return NetworkFailure(
          error: 'Access forbidden. You don\'t have permission.',
          type: NetworkFailureType.forbidden,
          statusCode: statusCode,
        );
      case 404:
        return NetworkFailure(
          error: 'Resource not found',
          type: NetworkFailureType.notFound,
          statusCode: statusCode,
        );
      case 422:
        return NetworkFailure(
          error: 'Validation error: $errorMessage',
          type: NetworkFailureType.validationError,
          statusCode: statusCode,
        );
      case 429:
        return NetworkFailure(
          error: 'Too many requests. Please try again later.',
          type: NetworkFailureType.tooManyRequests,
          statusCode: statusCode,
        );
      case 500:
        return NetworkFailure(
          error: 'Internal server error. Please try again later.',
          type: NetworkFailureType.internalServerError,
          statusCode: statusCode,
        );
      case 502:
        return NetworkFailure(
          error: 'Bad gateway. Server is temporarily unavailable.',
          type: NetworkFailureType.badGateway,
          statusCode: statusCode,
        );
      case 503:
        return NetworkFailure(
          error: 'Service unavailable. Please try again later.',
          type: NetworkFailureType.serviceUnavailable,
          statusCode: statusCode,
        );
      default:
        return NetworkFailure(
          error: errorMessage,
          type: NetworkFailureType.badResponse,
          statusCode: statusCode,
        );
    }
  }

  NetworkFailure _handleUnknownError(DioException error) {
    if (error.error is SocketException) {
      return const NetworkFailure(
        error: 'No internet connection. Please check your network.',
        type: NetworkFailureType.noInternetConnection,
      );
    }

    if (error.error is FormatException) {
      return const NetworkFailure(
        error: 'Invalid response format from server.',
        type: NetworkFailureType.formatError,
      );
    }

    return NetworkFailure(
      error:
          'Unknown network error: ${error.error?.toString() ?? error.message}',
      type: NetworkFailureType.unknown,
    );
  }
}

// Enhanced NetworkFailure class
enum NetworkFailureType {
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  validationError,
  tooManyRequests,
  internalServerError,
  badGateway,
  serviceUnavailable,
  badResponse,
  cancelled,
  noInternetConnection,
  formatError,
  unknown,
}
