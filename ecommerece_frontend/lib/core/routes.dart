import 'package:ecommerece_frontend/presentation/screens/auth/login_screen.dart';
import 'package:ecommerece_frontend/presentation/screens/auth/provider/login_provider.dart';
import 'package:ecommerece_frontend/presentation/screens/auth/provider/signup_provider.dart';
import 'package:ecommerece_frontend/presentation/screens/auth/signup_screen.dart';
import 'package:ecommerece_frontend/presentation/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/screens/home/home_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //login
      case LoginScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => LoginProvider(context),
                child: const LoginScreen()));

      //signup
      case SignUpScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => SignUpProvider(context),
                child: const SignUpScreen()));

      //home
      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (context) => HomeScreen());

      //splash
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => SplashScreen());

      default:
        return null; //404
    }
  }
}
