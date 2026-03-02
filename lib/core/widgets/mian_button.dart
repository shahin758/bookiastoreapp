import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:flutter/material.dart';

class MianButton extends StatelessWidget {
  const MianButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgColor = AppColors.primaryColor,
    this.borderColor,
    this.minimumWidth = double.infinity,
    this.minimumHeight = 56,
    this.textColor = AppColors.backgroundcolor,
  });
  final String text;
  final Function() onPressed;
  final Color bgColor;
  final Color? borderColor;
  final double minimumWidth;
  final double minimumHeight;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: Size(minimumWidth, minimumHeight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

        side: borderColor != null ? BorderSide(color: borderColor!) : null,
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyles.body16.copyWith(color: textColor)),
    );
  }
}
