import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/resources/routes_manager.dart';
import 'package:grocery_app/src/core/services_locator/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black)
        ),
      ),
      routerConfig: AppRouter().router,
    );
  }
}
