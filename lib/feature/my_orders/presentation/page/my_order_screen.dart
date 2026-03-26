import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 12,
        title: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffEAEAEA)),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:  Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Gap(100),
            Text('My Orders', style: TextStyles.text20),
            Gap(50)
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children:  [
                Text(
                  'Order No238562312',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Text(
                  '20/03/2020',
                  style: TextStyles.caption114.copyWith(color: AppColors.textcolor),
                ),
              ],
            ),
            Gap(20),
             Divider(color: AppColors.textcolor, thickness: 1),
            Gap(10),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Total Amount: ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff8E8E8E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '\$150',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
