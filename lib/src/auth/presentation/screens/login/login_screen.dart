import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/auth/presentation/screens/login/widget/build_form_field.dart';
import 'package:grocery_app/src/auth/presentation/screens/login/widget/sign_in_button.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_button.dart';
import 'package:grocery_app/src/core/resources/app_assets.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/resources/routes_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: _LoginScreenContent(),
      ),
    );
  }
}

class _LoginScreenContent extends StatelessWidget {
  const _LoginScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    //color: Colors.green,
                    child: Image.asset(
                      AppAssets.fresh,
                    ),
                  ),
                  const Text(
                    AppStrings.desc,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const InputFieldBuild(),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: CustomTextButton(
                  text: AppStrings.forgetPassword,
                  fontSize: 14,
                  fontColor: Colors.grey,
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SignInButton(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppStrings.noAccount,
                  ),
                  CustomTextButton(
                    text:AppStrings.signUp,
                    onPressed: () => context.goNamed(Routes.signUp),
                    fontColor: AppColors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}




