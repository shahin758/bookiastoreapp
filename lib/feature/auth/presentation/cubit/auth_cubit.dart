import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/register_params.dart';
import 'package:bookiastoreapp/feature/auth/data/repo/auth_repo.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordconfirmationController = TextEditingController();
  final otpVerfication = TextEditingController();
  final newpassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.login(
      RegisterParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState(message: 'Success Login'));
    } else {
      emit(AuthErrorState(message: 'Faild to Login'));
    }
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.register(
      RegisterParams(
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordconfirmationController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState(message: 'Success Register'));
    } else {
      emit(AuthErrorState(message: 'Faild to Register'));
    }
  }

  Future<void> forgetpassword() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.forgetpassword(
      RegisterParams(email: emailController.text),
    );
    if (response != null) {
      emit(AuthSuccessState(message: 'Password is Right'));
    } else {
      emit(AuthErrorState(message: 'Wrong Password'));
    }
  }

  Future<void> otpcode() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.otpcode(RegisterParams());
    if (response != null) {
      emit(AuthSuccessState(message: 'Code is Right'));
    } else {
      emit(AuthErrorState(message: 'Wrong Code'));
    }
  }

  Future<void> resetpassword() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.resetpassword(
      RegisterParams(
        password: passwordController.text,
        passwordConfirmation: passwordconfirmationController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState(message: 'Password Changed'));
    } else {
      emit(AuthErrorState(message: 'Cant Change Password'));
    }
  }
}
