import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/auth/data/model/user_model.dart';
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
          String uid = state.user!.user!.uid;
          showToast(
              AppStrings.createAccountMessage, ToastStates.SUCCESS, context);
          sl<AppPreferences>().setUserToken(uid);
          _saveUser(bloc, uid);
          context.goNamed(Routes.homeScreen);
        }
        if (state.signUpSate == AuthRequestState.error) {
          showToast(state.message, ToastStates.ERROR, context);
        }
      },
      builder: (context, state) {
        return !state.loading
            ? Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 50.w),
                decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(20.r)),
                child: CustomTextButton(
                  text: AppStrings.signUp.tr(),
                  fontColor: Colors.white,
                  onPressed: () {
                    if (bloc.signUpFormKey.currentState!.validate()) {
                      bloc.add(SignUpEvent(bloc.email.text, bloc.password.text));
                    }
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  void _saveUser(AuthBloc bloc, String uid) {
    bloc.add(SaveUserToFireStoreEvent(UserModel(
      uid: uid,
      image: "",
      name: bloc.userName.text,
      phone: "",
      email: bloc.email.text,
    )));
  }
}
