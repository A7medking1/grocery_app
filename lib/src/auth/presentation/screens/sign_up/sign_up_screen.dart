import 'package:flutter/material.dart';
import 'package:grocery_app/src/auth/presentation/screens/sign_up/widget/build_form_field.dart';
import 'package:grocery_app/src/auth/presentation/screens/sign_up/widget/sign_up_button.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=> sl<AppPreferences>().removeOnBoarding(), icon: const Icon(Icons.remove))
        ],
      ),
      body: const _SignUpScreenContent(),
    );
  }
}

class _SignUpScreenContent extends StatelessWidget {
  const _SignUpScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            AppStrings.createNewAccount,
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            AppStrings.descCreateNewAccount,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(
            height: 70,
          ),
          InputFieldBuild(),
          SizedBox(
            height: 40,
          ),
          SignUpButton(),
          SizedBox(
            height: 30,
          ),
          Text(
            AppStrings.orSignUpWith,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
