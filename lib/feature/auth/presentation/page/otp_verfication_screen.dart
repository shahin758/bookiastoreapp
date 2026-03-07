import 'dart:developer';

import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:bookiastoreapp/core/widgets/dialogs.dart';

import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookiastoreapp/feature/auth/presentation/cubit/auth_state.dart';

import 'package:bookiastoreapp/feature/auth/presentation/page/forget_password_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/password_changed_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/widgets/textspan.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpVerficationScreen extends StatelessWidget {
  const OtpVerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () => pop(context, ForgetPasswordScreen()),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('OTP Verification', style: TextStyles.headline30),
                    Gap(10),
                    Text(
                      'Enter the verification code we just sent on your email address.',
                      style: TextStyles.body16.copyWith(
                        color: AppColors.textcolor,
                      ),
                    ),
                    Gap(35),
                    Center(child: Pinput(length: 6, onCompleted: (pin) {})),
                    Gap(35),
                    MianButton(
                      bgColor: AppColors.primaryColor,
                      text: 'Verify ',
                      textColor: AppColors.backgroundcolor,
                      onPressed: () {
                        pushReplacement(context, PasswordChangedScreen());
                        cubit.otpcode();
                      },
                    ),
                    Gap(340),
                    Center(
                      child: Textspan(
                        text: 'Resend',
                        text2: 'Didn’t received code? ',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
