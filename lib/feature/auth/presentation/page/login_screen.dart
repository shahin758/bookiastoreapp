import 'dart:developer';

import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/functions/validations.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:bookiastoreapp/core/widgets/custome_text_form_field.dart';
import 'package:bookiastoreapp/core/widgets/dialogs.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/password_text_form_field.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_state.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/forget_password_screen.dart';
import 'package:bookiastoreapp/feature/main/main_app_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/register_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/welcome/welcome_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/widgets/social_login.dart';
import 'package:bookiastoreapp/feature/auth/presentation/widgets/textspan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () => pop(context, WelcomeScreen()),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CustomSvgPicture(path: AppImages.back),
            ),
          ),
        ),

        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              log('success');
            } else if (state is AuthErrorState) {
              showErrorDialog(context, state.message);
            } else if (state is AuthLoadingState) {
              showLoadingDialog(context);
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Padding(
              padding: const EdgeInsets.all(22),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      Text(
                        'Welcome back! Glad to see you, Again!',
                        style: TextStyles.headline30,
                      ),
                      Gap(32),
                      CustomeTextFormField(
                        hintText: 'Enter your email',
                        controller: cubit.emailController,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'please Enter Your Email';
                          } else if (!isValidEmail(input)) {
                            return 'Please Enter a Valid Email';
                          }
                          return null;
                        },
                      ),
                      Gap(15),
                      PasswordTextFormField(
                        hintText: 'Enter your password',
                        controller: cubit.passwordController,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Wrong Password';
                          }
                          return null;
                        },
                      ),
                      Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pushTo(context, ForgetPasswordScreen());
                            },
                            child: Text(
                              'Forget Pasword?',
                              style: TextStyles.caption114.copyWith(
                                color: AppColors.textcolor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(30),
                      
                        MianButton(
                          bgColor: AppColors.primaryColor,
                          text: 'Login',
                          textColor: AppColors.backgroundcolor,
                          onPressed: () {
                            pushReplacement(context, MainAppScreen());  
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.login();
                            }
                          },
                        ),
                      

                      Gap(35),
                      SocialLogin(),
                      Gap(35),
                      Textspan(
                        text: ' Register Now',
                        text2: 'Don’t have an account? ',
                        onPressed: () {
                          pushTo(context, RegisterScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
