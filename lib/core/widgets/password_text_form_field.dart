import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.onTap,
  });

  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;

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
      validator: widget.validator,
    );
  }
}
