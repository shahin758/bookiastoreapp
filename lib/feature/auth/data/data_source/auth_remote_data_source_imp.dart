import 'package:bookiastoreapp/core/services/dio/apis.dart';
import 'package:bookiastoreapp/core/services/dio/dio_provider.dart';
import 'package:bookiastoreapp/core/services/dio/failure.dart';
import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/feature/auth/data/data_source/remote_date_source.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_patams.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_response.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDateSourceImpl implements AuthRemoteDateSource {
  @override
  Future<Either<Failure, AuthResponse>> register(AuthParams params) async {
    try {
      var response = await DioProvider.postApi(
        endpoint: Apis.register,
        data: params.toJson(),
      );

      return response.fold(
        (l) => Left(l),
        (right) {
          var data = AuthResponse.fromJson(right);
          SharedPref.setToken(data.token ?? '');
          SharedPref.setUserInfo(data.user);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> login(AuthParams params) async {
    try {
      var response = await DioProvider.postApi(
        endpoint: Apis.login,
        data: params.toJson(),
      );

      return response.fold(
        (l) => Left(l),
        (right) {
          var data = AuthResponse.fromJson(right);
          SharedPref.setToken(data.token ?? '');
          SharedPref.setUserInfo(data.user);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> forgetpassword(
      AuthParams params) async {
    try {
      var response = await DioProvider.postApi(
        endpoint: Apis.forgetpassword,
        data: params.toJson(),
      );
      return response.fold(
        (l) => Left(l),
        (right) => Right(right),
      );
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, AuthResponse>> otpcode(AuthParams params) async {
    try {
      var response = await DioProvider.postApi(
        endpoint: Apis.forgetpassword,
        data: params.toJson(),
      );
      return response.fold(
        (l) => Left(l),
        (right) => Right(right),
      );
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
