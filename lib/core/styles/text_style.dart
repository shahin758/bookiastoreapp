import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle headline30 = TextStyle(fontSize: 30);
  static const TextStyle title24 = TextStyle(fontSize: 24);
  static const TextStyle subtitle18 = TextStyle(fontSize: 18);
  static const TextStyle text20 = TextStyle(fontSize: 20);
  static const TextStyle body16 = TextStyle(fontSize: 16);
  static const TextStyle caption114 = TextStyle(fontSize: 14);
  static const TextStyle caption212 = TextStyle(
    fontSize: 12,
    color: AppColors.textcolor,
  );
}
