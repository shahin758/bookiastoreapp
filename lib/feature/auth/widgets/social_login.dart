import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';

import 'package:bookiastoreapp/feature/auth/widgets/social_loginn.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Gap(20),
            Text(
              'Or',
              style: TextStyles.caption114.copyWith(color: AppColors.textcolor),
            ),
            Gap(20),
            Expanded(child: Divider()),
          ],
        ),
        Gap(20),
        SocialLoginn(
          path: AppImages.google,
          text: 'Sign in with Google',
          onTap: () {},
        ),
        Gap(20),
        SocialLoginn(
          path: AppImages.apple,
          text: 'Sign in with Apple',
          onTap: () {},
        ),
        
      ],
    );
  }
}
