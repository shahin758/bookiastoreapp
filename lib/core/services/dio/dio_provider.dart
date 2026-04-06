import 'package:bookiastoreapp/core/services/dio/apis.dart';
import 'package:bookiastoreapp/core/services/dio/base_response.dart';
import 'package:bookiastoreapp/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class DioProvider {
  static late final Dio dio;
  static void init() {
    dio = Dio(BaseOptions(baseUrl: Apis.baseUrl));
  }

  static Future<Either<Failure, dynamic>> postApi({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

  static Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

//-----------------------get api with error handling------------------
  static Future<Either<Failure, dynamic>> getApi({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.get(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

  static Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  //-----------------------put api with error handling------------------

  static Future<Either<Failure, dynamic>> putApi({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

  static Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  //-----------------------delete api with error handling------------------

  static Future<Either<Failure, dynamic>> deleteApi({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

  static Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  //-----------------------patch api with error handling------------------

  static Future<Either<Failure, dynamic>> patchApi({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.get(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        return Left(ApiFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (_) {
      return Left(UnknownFailure(message: "Something went wrong"));
    }
  }

  static Future<Response> patch({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.patch(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

//method to handle Dio exceptions and convert them to Failure objects

  static Failure _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkFailure(message: 'No Internet Connection');

      case DioExceptionType.badResponse:
        return ApiFailure(message: e.response?.data['message']);

      case DioExceptionType.cancel:
        return ApiFailure(message: 'Request was cancelled');

      case DioExceptionType.unknown:
        return UnknownFailure(message: 'Unexpected error occurred');

      default:
        return UnknownFailure(message: 'Unexpected error occurred');
    }
  }

  static Either<Failure, dynamic> _handleResponse(Response<dynamic> response) {
    if ((response.data as Map<String, dynamic>).containsKey('data')) {
      try {
        var baseResponse = BaseResponse.fromJson(response.data);
        return Right(baseResponse.data);
      } on Exception catch (e) {
        return Left(ParsingFailure(message: e.toString()));
      }
    } else {
      return Right(response.data);
    }
  }
}
