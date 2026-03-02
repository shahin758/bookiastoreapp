
import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/functions/validations.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:bookiastoreapp/core/widgets/custome_text_form_field.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/password_text_form_field.dart';
import 'package:bookiastoreapp/feature/auth/page/register_screen.dart';
import 'package:bookiastoreapp/feature/auth/widgets/social_login.dart';
import 'package:bookiastoreapp/feature/auth/widgets/textspan.dart';
import 'package:bookiastoreapp/feature/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => pop(context, WelcomeScreen()),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CustomSvgPicture(path: AppImages.back),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Welcome back! Glad to see you, Again!',
                  style: TextStyles.headline30,
                ),
                Gap(32),
                CustomeTextFormField(
                  hintText: 'Enter your email',
                  controller: emailController,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'please Enter Your Email';
                    } else if (!isValidEmail(input)) {
                      return 'Please Enter a Valid Email';
                    }
                    return null;
                  },
                ),
                Gap(15),
                PasswordTextFormField(
                  hintText: 'Enter your password',
                  controller: passwordController,

                ),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forget Pasword?',
                        style: TextStyles.caption114.copyWith(
                          color: AppColors.textcolor,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(30),
                MianButton(
                  bgColor: AppColors.primaryColor,
                  text: 'Login',
                  textColor: AppColors.backgroundcolor,
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      pushTo(context,const LoginScreen());
                    }
                  },
                ),
                Gap(35),
                SocialLogin(),
                Gap(35),
                Textspan(
                  text: ' Register Now',
                  text2: 'Don’t have an account? ', onPressed: () { pushTo(context, RegisterScreen()); },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
