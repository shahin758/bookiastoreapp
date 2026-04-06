import 'dart:developer';
import 'package:bookiastoreapp/core/services/dio/apis.dart';
import 'package:bookiastoreapp/core/services/dio/dio_provider.dart';
import 'package:bookiastoreapp/core/services/dio/failure.dart';
import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_response.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/register_params.dart';
import 'package:bookiastoreapp/feature/auth/data/models/otpcode_response.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  static Future<Either<Failure, AuthResponse>> register(
    RegisterParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.register,
      data: params.toJson(),
    );

    return response.fold(
      (l) {
        return Left(l);
      },
      (right) {
      var data = AuthResponse.fromJson(right);
        SharedPref.setToken(data.token ?? '');
        SharedPref.setUserInfo(data.user);
        return Right(data);
      },
    );
  }

//---------------------------------------------------------------------------------
  static Future<Either<Failure,AuthResponse>?> login(RegisterParams params) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.login,
      data: params.toJson(),
    );

   return response.fold((l){
      return Left(l);
    } , (right){
       var data = AuthResponse.fromJson(right);
        SharedPref.setToken(data.token ?? '');
        SharedPref.setUserInfo(data.user);
        return Right(data);
    });
  }



//---------------------------------------------------------------------------------
  static Future<AuthResponse?> forgetpassword(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.forgetpassword,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return null;
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Otpcode?> otpcode(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.otpcode,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return Otpcode.fromJson(response.data);
      }

      if (response.statusCode == 500) {
        return null;
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Otpcode?> resetpassword(RegisterParams params) async {
    try {
      log(params.toJson().toString());
      var response = await DioProvider.post(
        endpoint: Apis.otpcode,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return Otpcode.fromJson(response.data);
      }

      if (response.statusCode == 500) {
        return null;
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
