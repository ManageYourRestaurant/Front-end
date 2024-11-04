import 'package:flutter/material.dart';
import 'package:front_end/presentation/screens/signin/signin_screen.dart';
import 'package:front_end/presentation/screens/signup/signup_screen.dart';

class Routes {
  static const String signin = '/signin';
  static const String signUp = '/signUp';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.signin:
      return MaterialPageRoute(builder: (_) => SigninScreen());
    case Routes.signUp:
      return MaterialPageRoute(builder: (_) => SignupScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      );
  }
}
