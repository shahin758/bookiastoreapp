import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';

import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/feature/auth/page/create_new_password_screen.dart';
import 'package:bookiastoreapp/feature/auth/page/forget_password_screen.dart';
import 'package:bookiastoreapp/feature/auth/widgets/textspan.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpVerficationScreen extends StatefulWidget {
  const OtpVerficationScreen({super.key});

  @override
  State<OtpVerficationScreen> createState() => _OtpVerficationScreenState();
}

class _OtpVerficationScreenState extends State<OtpVerficationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('OTP Verification', style: TextStyles.headline30),
            Gap(10),
              Text(
                'Enter the verification code we just sent on your email address.',
                style: TextStyles.body16.copyWith(color: AppColors.textcolor),
              ),
          Gap(35),
              Center(
              child: Pinput(
                length: 6,
              
                onCompleted: (pin) {},
              ),
            ),
             Gap(35),
              MianButton(
                bgColor: AppColors.primaryColor,
                text: 'Verify ',
                textColor: AppColors.backgroundcolor,
                onPressed: () {
                  pushTo(context, CreateNewPasswordScreen());
                },
              ),
               Gap(340),
              Center(
                child: Textspan(
                  text: 'Resend',
                  text2: 'Didn’t received code? ',
                  onPressed: () {
                   
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