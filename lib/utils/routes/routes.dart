import 'package:api_with_provider/utils/routes/route_name.dart';
import 'package:api_with_provider/view/home/home.dart';
import 'package:api_with_provider/view/login/login_screen.dart';
import 'package:api_with_provider/view/sign_up/sign_up.dart';
import 'package:api_with_provider/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
