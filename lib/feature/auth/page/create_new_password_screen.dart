import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';

import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/password_text_form_field.dart';
import 'package:bookiastoreapp/feature/auth/page/otp_verfication_screen.dart';
import 'package:bookiastoreapp/feature/auth/page/password_changed_screen.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => pop(context, OtpVerficationScreen()),
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
              Text('Create new password', style: TextStyles.headline30),
              Gap(10),
             
              Text(
                'Your new password must be unique from those previously used.',
                style: TextStyles.body16.copyWith(color: AppColors.textcolor),
              ),
           Gap(32),
             PasswordTextFormField(hintText: 'New Password'),
              Gap(11),
              PasswordTextFormField(hintText: 'Confirm password'),
              Gap(50),
              MianButton(
                bgColor: AppColors.primaryColor,
                text: 'Reset Password',
                textColor: AppColors.backgroundcolor,
                onPressed: () {
                  pushTo(context, PasswordChangedScreen());
                },
              ),
            
             
            ],
          ),
          
        ),
      ),
    );
  }
}