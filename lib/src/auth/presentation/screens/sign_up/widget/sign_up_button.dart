import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_button.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.green,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 50),
      child: CustomTextButton(
        text: AppStrings.signUp,
        fontColor: Colors.white,
        onPressed: () {},
      ),
    );
  }
}
