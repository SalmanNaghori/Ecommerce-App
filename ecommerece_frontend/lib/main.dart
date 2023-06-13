import 'dart:developer';
import 'package:ecommerece_frontend/core/routes.dart';
import 'package:ecommerece_frontend/logic/cubit/category_cubit/category_cubit.dart';
import 'package:ecommerece_frontend/logic/cubit/user_cubit/user_cubit.dart';
import 'package:ecommerece_frontend/presentation/screens/auth/login_screen.dart';
import 'package:ecommerece_frontend/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  runApp((const EcommerceApp()));
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => CategoryCubit())
      ],
      child: MaterialApp(
        theme: Themes.defaultTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('Created: $bloc');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    log("onChange: $bloc $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    log("onTransition: $bloc $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    log("onError: $bloc $error $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    log("onClose $bloc");
    super.onClose(bloc);
  }
}
