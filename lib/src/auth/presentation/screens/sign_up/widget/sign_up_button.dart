import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/src/auth/presentation/controller/auth_bloc.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_button.dart';
import 'package:grocery_app/src/core/presentation/widget/flutter_toast.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();

    return BlocConsumer<AuthBloc  , AuthState>(
      listener: (context, state) {
        print('x');
        if(state.signUpSate == AuthRequestState.success){
          showToast('Create account Successfully', ToastStates.SUCCESS, context);
        }
        if(state.signUpSate == AuthRequestState.error){
          showToast(state.message, ToastStates.ERROR, context);
        }
      },
      builder: (context, state) {
        return !state.loading ? Container(
          color: AppColors.green,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 50),
          child: CustomTextButton(
            text: AppStrings.signUp,
            fontColor: Colors.white,
            onPressed: () {
              bloc.add(SignUpEvent(bloc.email.text, bloc.password.text));
            },
          ),
        ) : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
