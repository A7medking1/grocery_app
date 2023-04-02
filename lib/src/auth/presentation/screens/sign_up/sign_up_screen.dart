import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/src/auth/presentation/controller/auth_bloc.dart';
import 'package:grocery_app/src/auth/presentation/screens/sign_up/widget/build_form_field.dart';
import 'package:grocery_app/src/auth/presentation/screens/sign_up/widget/sign_up_button.dart';
import 'package:grocery_app/src/auth/presentation/screens/sign_up/widget/socrial_buttons.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => sl<AppPreferences>().removeOnBoarding(),
                icon: const Icon(Icons.remove))
          ],
        ),
        body: const _SignUpScreenContent(),
      ),
    );
  }
}

class _SignUpScreenContent extends StatelessWidget {
  const _SignUpScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Form(
          key: context.read<AuthBloc>().signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Text(
                AppStrings.createNewAccount.tr(),
                style: TextStyle(fontSize: 22.sp),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                AppStrings.descCreateNewAccount.tr(),
                style:  TextStyle(fontSize: 18.sp, color: Colors.grey),
              ),
               SizedBox(
                height: 30.h,
              ),
              const InputFieldBuild(),
               SizedBox(
                height: 30.h,
              ),
              const SignUpButton(),
               SizedBox(
                height: 30.h,
              ),
              Text(
                AppStrings.orSignUpWith.tr(),
                style:  TextStyle(
                  fontSize: 18.sp,
                ),
              ),
               SizedBox(
                height: 50.sp,
              ),
              const SocialButtonsBuild()
            ],
          ),
        ),
      ),
    );
  }
}

