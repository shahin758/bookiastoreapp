import 'package:bookiastoreapp/feature/main_profile/presentation/update_password/presentation/cubit/update_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitialState());
  final formKey = GlobalKey<FormState>();
  final newpasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final currentpassword = TextEditingController();
}
