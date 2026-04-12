import 'package:bookiastoreapp/feature/auth/data/data_source/auth_remote_data_source_imp.dart';
import 'package:bookiastoreapp/feature/auth/data/data_source/remote_date_source.dart';
import 'package:bookiastoreapp/feature/auth/data/repo/auth_repo_imp.dart';
import 'package:bookiastoreapp/feature/auth/domain/reposatory/auth_repo.dart';
import 'package:bookiastoreapp/feature/auth/domain/usecases/login_usecase.dart';
import 'package:bookiastoreapp/feature/auth/domain/usecases/register_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<AuthRemoteDateSource>(
      () => AuthRemoteDateSourceImpl());

  getIt.registerLazySingleton<AuthReposatory>(() => AuthReposatoryImp(getIt()));

  getIt.registerLazySingleton(() => LoginUsecase(getIt()));
  getIt.registerLazySingleton(() => RegisterUsecase(getIt()));
  getIt.registerLazySingleton<Dio>(() => Dio());
}
