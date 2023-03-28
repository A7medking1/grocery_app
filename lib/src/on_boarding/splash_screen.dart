import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/resources/app_assets.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';
import 'package:grocery_app/src/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:grocery_app/test.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppPreferences _preferences = sl<AppPreferences>();

  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), () => _goNext());
  }

  _goNext() {
    _preferences.isOnBoardingInPrefs().then((value) {
      print(value);
      if (value) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const Test()));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              AppStrings.fruitMarket,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: const BoxDecoration(
          //color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                AppAssets.splash1,
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
