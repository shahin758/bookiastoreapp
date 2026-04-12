import 'package:bookiastoreapp/core/services/dio/failure.dart';
import 'package:bookiastoreapp/feature/auth/data/data_source/remote_date_source.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_patams.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_response.dart';
import 'package:bookiastoreapp/feature/auth/domain/reposatory/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthReposatoryImp implements AuthReposatory {
  final AuthRemoteDateSource authremoteDateSource;

  AuthReposatoryImp(this.authremoteDateSource);
  @override
  Future<Either<Failure, AuthResponse>> login(AuthParams params) {
    return authremoteDateSource.login(params);
  }

  @override
  Future<Either<Failure, AuthResponse>> register(AuthParams params) {
    return authremoteDateSource.register(params);
  }

  @override
  Future<Object?> forgetpassword(AuthParams authParams) {
    throw UnimplementedError();
  }

  @override
  Future<Object?> otpcode(AuthParams authParams) {
    throw UnimplementedError();
  }

  @override
  Future<Object?> resetpassword(AuthParams authParams) {
    throw UnimplementedError();
  }
}
