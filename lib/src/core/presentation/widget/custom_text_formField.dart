import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;

  final TextInputType? textInputType;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.obscureText = false,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        // focusColor: Colors.green,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
          borderSide:  const BorderSide(
            color: AppColors.green,
          ),
        ),
        suffixIcon: suffixIcon,
        labelStyle: const TextStyle(
          color: AppColors.green,
        ),
      ),
    );
  }
}
