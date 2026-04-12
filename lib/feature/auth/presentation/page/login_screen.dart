import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/functions/validations.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custome_back_button.dart';
import 'package:bookiastoreapp/core/widgets/custome_text_form_field.dart';
import 'package:bookiastoreapp/core/widgets/dialogs.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/password_text_form_field.dart';
import 'package:bookiastoreapp/feature/auth/data/data_source/auth_remote_data_source_imp.dart';
import 'package:bookiastoreapp/feature/auth/data/repo/auth_repo_imp.dart';
import 'package:bookiastoreapp/feature/auth/domain/usecases/login_usecase.dart';
import 'package:bookiastoreapp/feature/auth/domain/usecases/register_usecase.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_state.dart';
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
      create: (context) => AuthCubit(LoginUsecase(AuthReposatoryImp(AuthRemoteDateSourceImpl())), registerUsecase: RegisterUsecase(AuthReposatoryImp(AuthRemoteDateSourceImpl()))),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: CustomeBackButton(),
        ),

        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Navigator.of(context).pop(); 
              pushToBase(context, Routes.mainappscreen);
            } else if (state is AuthErrorState) {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop(); 
              }
              showMyDialog(context, state.message);
            } else if (state is AuthLoadingState) {
              showLoadingDialog(context);
            }
          },
          builder: (context, state) {
            var   cubit = context.read<AuthCubit>();
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
                              pushTo(context, Routes.createnewpassword);
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
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.login(cubit.emailController.text, cubit.passwordController.text);
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
                          pushTo(context, Routes.registerscreen);
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
