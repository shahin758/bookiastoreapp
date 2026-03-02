import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SocialLoginn extends StatelessWidget {
  const SocialLoginn({
    super.key,
    required this.path,
    required this.text,
    required this.onTap,
  });
  final String path;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.bordercolor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: path),
            Gap(9),
            Text(
             text,
              style: TextStyles.caption114.copyWith(color: AppColors.textcolor),
            ),
          ],
        ),
      ),
    );
  }
}
