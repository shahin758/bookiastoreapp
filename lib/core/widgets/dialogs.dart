import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showErrorDialog(BuildContext context, String errorMsg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      backgroundColor: AppColors.errorcolor,
      content: Text(errorMsg),
    ),
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    
    builder: (context) => Center(child: Lottie.asset(AppImages.loading)),
  );
}
