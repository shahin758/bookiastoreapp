import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custome_back_button.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/my_body_view.dart';
import 'package:bookiastoreapp/core/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(children: [CustomeBackButton()]),
      ),
      body: MyBodyView(
        child: Column(
          children: [
            Center(
              child: Text(
                'New Password',
                style: TextStyles.headline30,
              ),
            ),
            Gap(70),
            PasswordTextFormField(
              //controller: _currentController,
              hintText: 'Current Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter current password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            Gap(20),
            PasswordTextFormField(
              //controller: _newController,
              hintText: 'New Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter new password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }

                /// if (value == _currentController.text) {
                // return 'New password must be different from current';
                // }
                return null;
              },
            ),
            Gap(20),
            PasswordTextFormField(
              //controller: _confirmController,
              hintText: 'Confirm password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm new password';
                }
                // if (value != _newController.text) {
                // return 'Passwords do not match';
                // }
                return null;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: MianButton(
          bgColor: AppColors.primaryColor,
          text: 'Update Password',
          textColor: AppColors.backgroundcolor,
          onPressed: () {
            
          },
        ),
      ),
    );
  }
}
