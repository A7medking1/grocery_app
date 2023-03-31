import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/src/auth/presentation/controller/auth_bloc.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_button.dart';
import 'package:grocery_app/src/core/presentation/widget/flutter_toast.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.logInState == AuthRequestState.error) {
          showToast(state.message, ToastStates.ERROR, context);
        }
        if (state.logInState == AuthRequestState.success) {
          showToast('SignIn Successfully', ToastStates.SUCCESS, context);
        }
      },
      builder: (context, state) {
        return !state.loading
            ? Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: CustomTextButton(
                  text: AppStrings.signIn,
                  fontColor: Colors.white,
                  onPressed: () async {
                    if (bloc.formKey.currentState!.validate()) {
                      bloc.add(LogInEvent(bloc.email.text, bloc.password.text));
                    }
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}