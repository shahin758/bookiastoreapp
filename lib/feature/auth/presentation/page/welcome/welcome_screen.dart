import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/login_screen.dart';
import 'package:bookiastoreapp/feature/auth/presentation/page/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            left: 22,
            right: 22,
            bottom: 0,
            child: Column(
              children: [
                Spacer(flex: 2),
                CustomSvgPicture(path: AppImages.logo),
                Gap(15),
                Text('Order Your Book Now!', style: TextStyles.text20),
                Spacer(flex: 4),
                MianButton(
                  text: 'Login',
                  onPressed: () {
                    pushTo(context, Routes.loginscreen);
                  },
                ),
                Gap(15),
                MianButton(
                  bgColor: AppColors.backgroundcolor,
                  text: 'Register',
                  textColor: AppColors.darkcolor,
                  borderColor: AppColors.darkcolor,
                  onPressed: () {
                    pushTo(context, Routes.registerscreen);
                  },
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
