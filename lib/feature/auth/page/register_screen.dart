import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';

import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:bookiastoreapp/core/widgets/custome_text_form_field.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/password_text_form_field.dart';
import 'package:bookiastoreapp/feature/auth/page/forget_password_screen.dart';
import 'package:bookiastoreapp/feature/auth/page/login_screen.dart';

import 'package:bookiastoreapp/feature/auth/widgets/textspan.dart';
import 'package:bookiastoreapp/feature/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            children: [
              Text(
                'Hello! Register to get started',
                style: TextStyles.headline30,
              ),
              Gap(32),
              CustomeTextFormField(hintText: 'Username'),
              Gap(11),
              CustomeTextFormField(hintText: 'Email'),
              Gap(15),
              PasswordTextFormField(hintText: 'Password'),
              Gap(11),
              PasswordTextFormField(hintText: 'Confirm password'),
              Gap(15),
          
              Gap(30),
              MianButton(
                bgColor: AppColors.primaryColor,
                text: 'Register ',
                textColor: AppColors.backgroundcolor,
                onPressed: () {pushTo(context, ForgetPasswordScreen());},
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
  }
}
