import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/firebase_options.dart';
import 'package:grocery_app/src/core/resources/app_theme.dart';
import 'package:grocery_app/src/core/resources/routes_manager.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      routerConfig: AppRouter().router,
    );
  }
}
