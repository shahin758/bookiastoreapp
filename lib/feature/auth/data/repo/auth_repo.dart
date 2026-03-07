import 'dart:developer';
import 'package:bookiastoreapp/core/services/dio/apis.dart';
import 'package:bookiastoreapp/core/services/dio/dio_provider.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/register_params.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/register_response.dart';
import 'package:bookiastoreapp/feature/auth/data/models/otpcode_response.dart';

class AuthRepo {
  static Future<AuthResponse?> register(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.register,
        data: params.toJson(),
      );
      if (response.statusCode == 201) {
        response.data;
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.login,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        response.data;
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

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
