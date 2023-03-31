import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/src/auth/presentation/controller/auth_bloc.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_formField.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';

class InputFieldBuild extends StatelessWidget {
  const InputFieldBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return Column(
      children: [
        CustomTextFormField(
          controller: bloc.userName,
          labelText: AppStrings.name,
          textInputType: TextInputType.name,
          prefixIcon: const Icon(Icons.person),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormField(
          controller: bloc.email,
          labelText: AppStrings.email,
          textInputType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email_outlined),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormField(
          controller: bloc.password,
          labelText: AppStrings.password,
          textInputType: TextInputType.visiblePassword,
          suffixIcon: const Icon(Icons.visibility_outlined),
          prefixIcon: const Icon(Icons.key),
        ),
      ],
    );
  }
}
