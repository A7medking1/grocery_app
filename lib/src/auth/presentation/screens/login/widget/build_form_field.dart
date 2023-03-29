import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_formField.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';

class InputFieldBuild extends StatelessWidget {
  const InputFieldBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomTextFormField(
          labelText: AppStrings.email,
          textInputType: TextInputType.emailAddress,
          prefixIcon: Icon(Icons.email_outlined),
        ),
        SizedBox(
          height: 30,
        ),
        CustomTextFormField(
          labelText: AppStrings.password,
          textInputType: TextInputType.visiblePassword,
          suffixIcon: Icon(Icons.visibility_outlined),
          prefixIcon: Icon(Icons.key),
        ),
      ],
    );
  }
}
