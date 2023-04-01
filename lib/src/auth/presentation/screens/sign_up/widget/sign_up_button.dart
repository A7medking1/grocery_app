import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/auth/presentation/controller/auth_bloc.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_button.dart';
import 'package:grocery_app/src/core/presentation/widget/flutter_toast.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/resources/routes_manager.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.signUpSate == AuthRequestState.success) {
          showToast(AppStrings.createAccountMessage, ToastStates.SUCCESS, context);
          sl<AppPreferences>().setUserToken(state.user!.user!.uid);
          context.goNamed(Routes.homeScreen);
        }
        if (state.signUpSate == AuthRequestState.error) {
          showToast(state.message, ToastStates.ERROR, context);
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
                  text: AppStrings.signUp,
                  fontColor: Colors.white,
                  onPressed: () {
                    if (bloc.signUpFormKey.currentState!.validate()) {
                      bloc.add(
                          SignUpEvent(bloc.email.text, bloc.password.text));
                    }
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
