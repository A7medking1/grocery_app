import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/presentation/widget/custom_text_button.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';
import 'package:grocery_app/src/on_boarding/presentation/widget/page_view_builder.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: _OnBoardingScreenContent(),
      ),
    );
  }
}

class _OnBoardingScreenContent extends StatelessWidget {
   _OnBoardingScreenContent({Key? key}) : super(key: key);

  final AppPreferences _preferences = sl<AppPreferences>();

  void _submit(){
    _preferences.setOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsetsDirectional.only(end: 30, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                text: AppStrings.skip,
                onPressed: () => _submit(),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 120,
        ),
        const Expanded(
          child: PageViewBuilder(),
        ),
      ]),
    );
  }
}




