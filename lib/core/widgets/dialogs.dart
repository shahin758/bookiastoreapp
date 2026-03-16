import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum DialogType { success, error }

void showMyDialog(
  BuildContext context,
  String errorMsg, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      backgroundColor: type == DialogType.error
          ? AppColors.errorcolor
          : Colors.green,
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
