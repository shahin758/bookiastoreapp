import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custome_back_button.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/password_text_form_field.dart';
import 'package:bookiastoreapp/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookiastoreapp/feature/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 8,
          title: const Row(children: [CustomeBackButton()]),
        ),
        body: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is UpdatePasswordSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Password updated successfully')),
              );
              Navigator.pop(context);
            } else if (state is UpdatePasswordErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(40),
                  Center(child: Text('New Password', style: TextStyles.title24)),
                  Gap(50),
                  PasswordTextFormField(
                    controller: _currentController,
                    hintText: 'Current Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter current password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  Gap(20),
                  PasswordTextFormField(
                    controller: _newController,
                    hintText: 'New Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter new password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      if (value == _currentController.text) {
                        return 'New password must be different from current';
                      }
                      return null;
                    },
                  ),
                  Gap(20),
                  PasswordTextFormField(
                    controller: _confirmController,
                    hintText: 'Confirm password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm new password';
                      }
                      if (value != _newController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final isLoading = state is UpdatePasswordLoadingState;
                      return MianButton(
                        bgColor: AppColors.primaryColor,
                        text: isLoading ? 'Updating...' : 'Update Password',
                        textColor: AppColors.backgroundcolor,
                        onPressed: () {
                          if (!isLoading && _formKey.currentState!.validate()) {
                            final cubit = context.read<ProfileCubit>();
                            cubit.updatePassword(
                              _currentController.text,
                              _newController.text,
                              _confirmController.text,
                            );
                          }
                        },



                      );
                    },
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

