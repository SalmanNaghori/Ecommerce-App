import 'package:ecommerece_frontend/core/ui.dart';
import 'package:ecommerece_frontend/presentation/screens/auth/provider/login_provider.dart';
import 'package:ecommerece_frontend/presentation/widget/gap_widget.dart';
import 'package:ecommerece_frontend/presentation/widget/link_button.dart';
import 'package:ecommerece_frontend/presentation/widget/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../widget/primary_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Ecommerce App'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          children: [
            Text(
              'Log In',
              style: TextStyles.heading1,
            ),
            const GapWidget(size: -10),
            (provider.error != "")
                ? Text(provider.error,
                    style: TextStyle(color: Colors.redAccent))
                : SizedBox(),
            const GapWidget(size: 5),
            PrimaryTextField(
              controller: provider.emailController,
              labelText: "Email",
            ),
            const GapWidget(
              size: 0.0,
            ),
            PrimaryTextField(
              controller: provider.passwordController,
              labelText: "Password",
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LinkButton(
                  onPressed: () {},
                  buttonTitle: "Forgot Password?",
                ),
              ],
            ),
            const GapWidget(
              size: 0.0,
            ),
            PrimaryButton(
              buttonTitle: (provider.isLoading) ? "......" : "Log In",
              onPressed: provider.logIn,
            ),
            const GapWidget(
              size: 0.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?', style: TextStyles.body2),
                const GapWidget(
                  size: 0.0,
                ),
                LinkButton(
                  onPressed: () {},
                  buttonTitle: "Sign Up",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
