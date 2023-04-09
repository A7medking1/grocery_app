import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/core/presentation/widget/cutom_list_tile.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/resources/routes_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SettingsScreenContent(),
    );
  }
}

class SettingsScreenContent extends StatelessWidget {
  const SettingsScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BuildListTile();
  }
}

class BuildListTile extends StatelessWidget {
  const BuildListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 20.h),
      child: Column(
        children: [
          CustomListTile(
            title: AppStrings.account.tr(),
            icon: Icons.account_circle_rounded,
            onTap: () {},
          ),
          CustomListTile(
            title: AppStrings.notifications.tr(),
            onTap: () {},
            icon: Icons.notifications,
          ),
          CustomListTile(
            title: AppStrings.language.tr(),
            icon: Icons.language,
            onTap: () {
              context.pushNamed(Routes.language);
            },
          ),
        ],
      ),
    );
  }
}
