import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => sl<AppPreferences>().removeUserToken(),
              icon: const Icon(Icons.remove))
        ],
      ),
    );
  }
}
