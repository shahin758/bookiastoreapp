import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    String? token = SharedPref.getToken();
    Future.delayed(const Duration(seconds: 3), () {
      if (token != null && token.isNotEmpty) {
        pushReplacement(context, Routes.mainappscreen);
      } else {
        pushReplacement(context, Routes.welcomescreen);
      }

      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: AppImages.logo, width: 250),
            Gap(10),
            Text('Order Your Book Now!', style: TextStyles.subtitle18),
          ],
        ),
      ),
    );
  }
}
