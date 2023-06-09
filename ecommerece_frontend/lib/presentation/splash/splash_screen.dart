import 'dart:async';

import 'package:ecommerece_frontend/core/ui.dart';
import 'package:ecommerece_frontend/logic/cubit/user_cubit/user_cubit.dart';
import 'package:ecommerece_frontend/logic/cubit/user_cubit/user_state.dart';
import 'package:ecommerece_frontend/presentation/screens/auth/login_screen.dart';
import 'package:ecommerece_frontend/presentation/screens/home/home_screen.dart';
import 'package:ecommerece_frontend/presentation/widget/gap_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void goToNextScreen() {
    UserState userState = BlocProvider.of<UserCubit>(context).state;
    if (userState is UserLoggedInState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else if (userState is UserLoggedOutState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else if (userState is UserErrorState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 100), () {
      goToNextScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        goToNextScreen();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(children: [
            const GapWidget(size: 60),
            Center(
                child: CupertinoActivityIndicator(
              radius: 25,
            )),
            const GapWidget(size: 50),
            Text(
              'Welcome',
              style: TextStyles.heading1,
            ),
          ]),
        ),
      ),
    );
  }
}
