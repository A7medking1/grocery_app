import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/src/auth/presentation/controller/auth_bloc.dart';
import 'package:grocery_app/src/auth/presentation/screens/validator_form.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_formField.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';

class InputFieldBuild extends StatelessWidget with Validator{
  const InputFieldBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return Column(
      children:  [
        CustomTextFormField(
          controller: bloc.email,
          labelText: AppStrings.email.tr(),
          validator: (value)=> validateEmail(value),
          textInputType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email_outlined),
        ),
         SizedBox(
          height: 30.h,
        ),
        CustomTextFormField(
          controller: bloc.password,
          labelText: AppStrings.password.tr(),
          textInputType: TextInputType.visiblePassword,
          suffixIcon: const Icon(Icons.visibility_outlined),
          validator: (value) => validatePassword(value),
          prefixIcon: const Icon(Icons.key),
        ),
      ],
    );
  }
}
