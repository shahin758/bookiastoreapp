import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:bookiastoreapp/core/widgets/custome_text_form_field.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/feature/auth/page/login_screen.dart';
import 'package:bookiastoreapp/feature/auth/page/otp_verfication_screen.dart';
import 'package:bookiastoreapp/feature/auth/widgets/textspan.dart';
import 'package:bookiastoreapp/feature/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Forgot Password?', style: TextStyles.headline30),
              Gap(10),
              Text(
                'Dont worry! It occurs. Please enter the email address linked with your account.',
                style: TextStyles.body16.copyWith(color: AppColors.textcolor),
              ),
              Gap(30),
              CustomeTextFormField(hintText: 'Enter your email'),
              Gap(40),
              MianButton(
                bgColor: AppColors.primaryColor,
                text: 'Send Code ',
                textColor: AppColors.backgroundcolor,
                onPressed: () {
                  pushTo(context, OtpVerficationScreen());
                },
              ),
                Gap(361),
              Center(
                child: Textspan(
                  text: 'Login',
                  text2: 'Remember Password? ',
                  onPressed: () {
                    pushTo(context, LoginScreen());
                  },
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}
