import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerBooks extends StatelessWidget {
  const BestSellerBooks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('The Republic', style: TextStyles.subtitle18),
        Gap(25),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹285',
                style: TextStyles.body16.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(5),
              SizedBox(
                height: 30,
                child: MianButton(
                  minimumWidth: 70,
                  minimumHeight: 30,
                  bgColor: AppColors.darkcolor,
                  text: 'Buy',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
