import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:flutter/material.dart';

class Textspan extends StatelessWidget {
  const Textspan({
    super.key,
    required this.text,
    required this.text2,
    required this.onPressed,
  });
  final String text;
  final String text2;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text2,
            style: TextStyles.caption114.copyWith(color: AppColors.darkcolor),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyles.caption114.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
