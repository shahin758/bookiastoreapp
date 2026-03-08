
import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:bookiastoreapp/core/widgets/custome_text_form_field.dart';
import 'package:bookiastoreapp/core/widgets/dialogs.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/password_text_form_field.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_state.dart';

import 'package:bookiastoreapp/feature/auth/presentation/page/login_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/widgets/textspan.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/welcome/welcome_screen.dart';
import 'package:bookiastoreapp/feature/main/main_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
           
               pushToBase(context, MainAppScreen());
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
                        'Hello! Register to get started',
                        style: TextStyles.headline30,
                      ),
                      Gap(32),
                      CustomeTextFormField(
                        controller: cubit.usernameController,
                        hintText: 'Username',
                      ),

                      Gap(11),
                      CustomeTextFormField(
                        controller: cubit.emailController,
                        hintText: 'Email',
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Wrong Password';
                          }
                          return null;
                        },
                      ),
                      Gap(15),
                      PasswordTextFormField(
                        controller: cubit.passwordController,
                        hintText: 'Password',
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Wrong Password';
                          }
                          return null;
                        },
                      ),
                      Gap(11),
                      PasswordTextFormField(
                        controller: cubit.passwordconfirmationController,
                        hintText: 'Confirm password',
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Wrong Password';
                          }
                          return null;
                        },
                      ),
                      Gap(15),

                      Gap(30),

                      MianButton(
                        bgColor: AppColors.primaryColor,
                        text: 'Register ',
                        textColor: AppColors.backgroundcolor,
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.register();
                          }
                        },
                      ),

                      Gap(35),

                      Textspan(
                        text: '  Login Now',
                        text2: 'Already have an account?  ',
                        onPressed: () {
                          pushTo(context, LoginScreen());
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
