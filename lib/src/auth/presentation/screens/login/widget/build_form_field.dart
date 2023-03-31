import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/src/auth/presentation/controller/auth_bloc.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_formField.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
bool emailValid(String email) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

class InputFieldBuild extends StatelessWidget {
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
          labelText: AppStrings.email,
          validator: (value){
            if(value!.isEmpty){
              return "Email Required";
            }
            if(!emailValid(value)){
              return "Email Not Valid";
            }
            return null;
          },
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
          validator: (value){
            if(value!.isEmpty){
              return "Password Required";
            }
            if(value.length <= 5){
              return "password short";
            }
            return null;
          },
          prefixIcon: const Icon(Icons.key),
        ),
      ],
    );
  }
}
