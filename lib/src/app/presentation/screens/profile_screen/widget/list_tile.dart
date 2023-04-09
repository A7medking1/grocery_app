import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/presentation/widget/cutom_list_tile.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/resources/routes_manager.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';

class BuildListTile extends StatelessWidget {
  const BuildListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: AppStrings.myOrder.tr(),
          icon: Icons.shop,
          onTap: (){},
        ),
        CustomListTile(
          title: AppStrings.favorites.tr(),
          onTap: (){},
          icon: Icons.favorite,
        ),
        CustomListTile(
          title: AppStrings.settings.tr(),
          icon: Icons.settings,
          onTap: (){
            context.pushNamed(Routes.setting);
          },
        ),
        CustomListTile(
          title:AppStrings.rateUs.tr(),
          onTap: (){},
          icon: Icons.star_rate,
        ),   CustomListTile(
          title: AppStrings.help.tr(),
          icon: Icons.help,
          onTap: (){},
        ),
        CustomListTile(
          title: AppStrings.logOut.tr(),
          onTap: (){
            sl<AppPreferences>().removeUserToken();
          },
          icon: Icons.logout,
        ),
      ],
    );
  }
}
