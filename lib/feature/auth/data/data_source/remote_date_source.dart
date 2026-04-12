import 'package:bookiastoreapp/core/services/dio/failure.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_response.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_patams.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteDateSource {
  Future<Either<Failure, AuthResponse>> register(AuthParams params);
  Future<Either<Failure, AuthResponse>> login(AuthParams params);
  Future<Object?> forgetpassword(AuthParams authParams);

}

