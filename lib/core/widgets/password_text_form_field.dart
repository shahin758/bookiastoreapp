import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    required this.hintText,
    this.controller,
  });

  final String? hintText;
  final TextEditingController? controller;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,

      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          color: AppColors.textcolor,
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.remove_red_eye),
        ),
      ),
      validator: (input) {
        if (input!.isEmpty) {
          return 'Wrong Password';
        }
        return null;
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
