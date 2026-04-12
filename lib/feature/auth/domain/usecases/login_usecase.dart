import 'package:bookiastoreapp/core/services/dio/failure.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_patams.dart';
import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_response.dart';
import 'package:bookiastoreapp/feature/auth/domain/reposatory/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final AuthReposatory authReposatory;

  LoginUsecase(this.authReposatory);

  Future<Either<Failure, AuthResponse>> login(AuthParams params) {
    return authReposatory.login(params);
  }
}
