import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';

class CustomeBackButton extends StatelessWidget {
  const CustomeBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => pop(context, route: Routes.welcomescreen),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CustomSvgPicture(path: AppImages.back),
          ),
        ),
      ],
    );
  }
}
