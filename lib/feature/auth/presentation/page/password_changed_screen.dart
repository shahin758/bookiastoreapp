import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset(AppImages.success)),
          SizedBox(height: 50),
          Text(
            'Password Changed!',
            style: TextStyles.title24,
            textAlign: TextAlign.center,
          ),
          Gap(10),
          Text(
            'Your password has been changed successfully.',
            textAlign: TextAlign.center,

            style: TextStyles.body16.copyWith(color: AppColors.textcolor),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20),
            child: MianButton(
              text: 'Back to Login',
              onPressed: () {
                pushReplacement(context, Routes.loginscreen);
              }, minWidth: 0, minHeight: 0,
            ),
          ),
        ],
      ),
    );
  }
}
