import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/auth/presentation/controller/auth_bloc.dart';
import 'package:grocery_app/src/auth/presentation/screens/login/widget/build_form_field.dart';
import 'package:grocery_app/src/auth/presentation/screens/login/widget/log_in_button.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_button.dart';
import 'package:grocery_app/src/core/resources/app_assets.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/resources/routes_manager.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child:  const Scaffold(
          body: _LoginScreenContent(),
        ),
      ),
    );
  }
}

class _LoginScreenContent extends StatelessWidget {


   const _LoginScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return SafeArea(
      child: Padding(
        padding:  EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Form(
            key: bloc.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 250.h,
                      width: double.infinity,
                      //color: Colors.green,
                      child: Image.asset(
                        AppAssets.fresh,
                      ),
                    ),
                    Text(
                      AppStrings.desc.tr(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .displayLarge,
                    ),
                  ],
                ),
                 SizedBox(
                  height: 50.h,
                ),
                const InputFieldBuild(),
                 SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomTextButton(
                    text: AppStrings.forgetPassword.tr(),
                    fontSize: 14.sp,
                    fontColor: Colors.grey,
                    onPressed: () {},
                  ),
                ),
                 SizedBox(
                  height: 20.h,
                ),
                const SignInButton(),
                 SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      AppStrings.noAccount.tr(),
                    ),
                    CustomTextButton(
                      text: AppStrings.signUp.tr(),
                      onPressed: () => context.goNamed(Routes.signUp),
                      fontColor: AppColors.green,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




