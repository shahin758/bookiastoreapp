import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';



class AcceptOrderScreen extends StatelessWidget {
  const AcceptOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImages.donee)),
          Gap(50),
          Text(
            'Success !',
            style: TextStyles.headline30,
            textAlign: TextAlign.center,
          ),
          Gap(22),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your order will be delivered soon. Thank you for choosing our app!',
              textAlign: TextAlign.center,
            
              style: TextStyles.subtitle18.copyWith(color: AppColors.textcolor),
            ),
          ),
          Gap(53),
          Padding(
            padding: const EdgeInsets.all(20),
            child: MianButton(
              
              text: 'Back To Home',
              onPressed: () {
                pushReplacement(context, Routes.homescreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
