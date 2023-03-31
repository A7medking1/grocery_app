import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/font_manager.dart';
import 'package:grocery_app/src/core/resources/style.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      displayLarge:
          getSemiBoldStyle(color: AppColors.darkGrey, fontSize: FontSize.s22),
      headlineLarge:
          getSemiBoldStyle(color: AppColors.darkGrey, fontSize: FontSize.s22),
      headlineMedium:
          getRegularStyle(color: AppColors.darkGrey, fontSize: FontSize.s18),
      titleMedium:
          getMediumStyle(color: AppColors.green, fontSize: FontSize.s16),
      titleSmall:
          getRegularStyle(color: AppColors.white, fontSize: FontSize.s16),
      bodyLarge: getRegularStyle(color: AppColors.grey1),
      bodySmall: getRegularStyle(color: AppColors.grey),
      bodyMedium:
          getRegularStyle(color: AppColors.grey2, fontSize: FontSize.s12),
      labelSmall: getBoldStyle(
        color: AppColors.green,
        fontSize: FontSize.s12,
      ),
    ),
  );
}
