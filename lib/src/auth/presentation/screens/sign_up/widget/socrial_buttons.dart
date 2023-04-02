import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/src/core/resources/app_assets.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';

class SocialButtonsBuild extends StatelessWidget {
  const SocialButtonsBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SocialMediaButton(
            svgIcon: AppAssets.google,
            onPressed: () {},
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: SocialMediaButton(
            svgIcon: AppAssets.facebook,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String svgIcon;

  final void Function() onPressed;

  const SocialMediaButton({
    super.key,
    required this.onPressed,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        side:  BorderSide(color: AppColors.black),
        borderRadius: BorderRadius.circular(10.r),
      ),
      onPressed: onPressed,
      child: Padding(
        padding:  EdgeInsets.all(8.0.h),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
            ),
             SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Text(
                AppStrings.logInWith.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
