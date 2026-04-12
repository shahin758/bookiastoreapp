import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/auth_patams.dart';
import 'package:bookiastoreapp/feature/auth/domain/reposatory/auth_repo.dart';
import 'package:bookiastoreapp/feature/auth/domain/usecases/login_usecase.dart';
import 'package:bookiastoreapp/feature/auth/domain/usecases/register_usecase.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {


  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordconfirmationController = TextEditingController();
  final otpVerfication = TextEditingController();
  final newpassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AuthCubit(super.initialState, {required this.loginUsecase, required this.registerUsecase});






Future<void> login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      final response = await loginUsecase.login(
        AuthParams(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      response.fold(
        (failure) => emit(AuthErrorState(message: failure.message)),
        (_) => emit(AuthSuccessState(message: 'Login successful')),
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

Future<void> register(String username, String email, String password, String passwordConfirmation) async {
    emit(AuthLoadingState());
    final response = await registerUsecase.register(
      AuthParams(
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordconfirmationController.text,
      ),
    );
    response.fold(
      (failure) => emit(AuthErrorState(message: failure.message)),
      (_) => emit(AuthSuccessState(message: 'Registration successful')),
    );
  }

  void forgetpassword() {}

  void otpcode() {}

}
