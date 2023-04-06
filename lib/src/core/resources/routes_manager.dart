import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/auth/presentation/screens/login/login_screen.dart';
import 'package:grocery_app/src/auth/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:grocery_app/src/core/presentation/screen/main_home_screen.dart';
import 'package:grocery_app/src/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:grocery_app/src/splash/splash_screen.dart';
import 'package:grocery_app/test.dart';

class Routes {
  static const splash = '/';
  static const onBoarding = 'onBoarding';
  static const login = 'login';
  static const signUp = 'signUp';
  static const test = 'test';
  static const homeScreen = 'homeScreen';
}

class RouterPath {
  static const splash = '/';
  static const onBoarding = '/onBoarding';
  static const login = '/login';
  static const signUp = 'signUp';
  static const test = '/test';
  static const homeScreen = '/homeScreen';
}

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: RouterPath.splash,
    routes: [
      GoRoute(
        name: Routes.splash,
        path: RouterPath.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: Routes.onBoarding,
        path: RouterPath.onBoarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
          name: Routes.login,
          path: RouterPath.login,
          builder: (context, state) => const LoginScreen(),
          routes: [
            GoRoute(
              name: Routes.signUp,
              path: RouterPath.signUp,
              builder: (context, state) => const SignUpScreen(),
            ),
          ]),
      GoRoute(
        name: Routes.test,
        path: RouterPath.test,
        builder: (context, state) => const Test(),
      ),
      GoRoute(
        name: Routes.homeScreen,
        path: RouterPath.homeScreen,
        builder: (context, state) => const AppLayOutScreen(),
      ),
    ],
  );
}
