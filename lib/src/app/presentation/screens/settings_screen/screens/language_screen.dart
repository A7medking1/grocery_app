import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/resources/app_strings.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String currentLang = 'ar';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sl<AppPreferences>().getAppLang().then((value) {
      currentLang = value;
      print(value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(currentLang);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              AppStrings.changeLang.tr(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            50.verticalSpace,
            ListTile(
              title:  Text(
                AppStrings.changeLang.tr(),
              ),
              leading: const Icon(
                Icons.language,
              ),
              trailing: DropdownButton(
                onChanged: (v) => setState(() {
                  //MainApp.setLocale(context, Locale(v.toString(), ""));
                  sl<AppPreferences>().changeAppLang();
                  Phoenix.rebirth(context);
                }),
                value: currentLang,
                items: const [
                  DropdownMenuItem(value: 'en', child: Text('English')),
                  DropdownMenuItem(value: 'ar', child: Text('العربية')),
                ],
              ),
            )
            /*CustomListTile(
              title: 'change Language',
              onTap: (){

              },
              icon: Icons.language,
            ),*/
          ],
        ),
      ),
    );
  }
}
