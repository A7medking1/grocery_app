import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/src/app/presentation/screens/categories_screen/categories_screen.dart';
import 'package:grocery_app/src/app/presentation/screens/favorite_screen/favorite_screen.dart';
import 'package:grocery_app/src/app/presentation/screens/home_screen/home_screen.dart';
import 'package:grocery_app/src/app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/resources/app_assets.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';

class AppLayOutScreen extends StatefulWidget {
  const AppLayOutScreen({Key? key}) : super(key: key);

  @override
  State<AppLayOutScreen> createState() => _AppLayOutScreenState();
}

class _AppLayOutScreenState extends State<AppLayOutScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   /*   appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => sl<AppPreferences>().removeUserToken(),
              icon: const Icon(Icons.remove)),
          IconButton(
              onPressed: () {
                sl<AppPreferences>().changeAppLang();
                Phoenix.rebirth(context);
              },
              icon: const Icon(Icons.change_circle_outlined)),
        ],
      ),*/
      body: screens[currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          //  backgroundColor: Colors.grey.shade900,
          activeIcon: _ActiveIcon(text: AppStrings.home.tr()),
          label: '',
          icon: const _IconBottomNavBat(svgIcon: AppAssets.home),
        ),
        BottomNavigationBarItem(
          activeIcon: _ActiveIcon(text: AppStrings.cart.tr()),
          label: '',
          icon: const _IconBottomNavBat(svgIcon: AppAssets.cart),
        ),
        BottomNavigationBarItem(
          activeIcon: _ActiveIcon(text: AppStrings.heart.tr()),
          label: '',
          icon: const _IconBottomNavBat(svgIcon: AppAssets.heart),
        ),
        BottomNavigationBarItem(
          activeIcon: _ActiveIcon(text: AppStrings.user.tr()),
          label: '',
          icon: const _IconBottomNavBat(svgIcon: AppAssets.user),
        ),
      ],
    );
  }
}

class _IconBottomNavBat extends StatelessWidget {
  final String svgIcon;

  const _IconBottomNavBat({Key? key, required this.svgIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20),
      child: SvgPicture.asset(
        svgIcon,
        fit: BoxFit.contain,
        color: AppColors.green,
        width: 20,
      ),
    );
  }
}

class _ActiveIcon extends StatelessWidget {
  final String text;

  const _ActiveIcon({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 18.0),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.green,
        ),
      ),
    );
  }
}
