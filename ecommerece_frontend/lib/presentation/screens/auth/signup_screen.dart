import 'package:ecommerece_frontend/core/ui.dart';
import 'package:ecommerece_frontend/presentation/screens/auth/provider/signup_provider.dart';
import 'package:ecommerece_frontend/presentation/widget/gap_widget.dart';
import 'package:ecommerece_frontend/presentation/widget/link_button.dart';
import 'package:ecommerece_frontend/presentation/widget/primary_button.dart';
import 'package:ecommerece_frontend/presentation/widget/primary_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = "signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text('Ecommerce App'),
      ),
      body: SafeArea(
        child: Form(
          key: provider.formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            children: [
              Text(
                'Create Account',
                style: TextStyles.heading1,
              ),
              const GapWidget(size: -10),
              (provider.error != "")
                  ? Text(provider.error,
                      style: TextStyle(color: Colors.redAccent))
                  : SizedBox(),
              const GapWidget(size: 5),

              //email form
              PrimaryTextField(
                controller: provider.emailController,
                labelText: "Email",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email address is required";
                  }
                  if (!EmailValidator.validate(value.trim())) {
                    return "Invalid email address";
                  }
                  return null;
                },
              ),
              const GapWidget(
                size: 0.0,
              ),

              //password form
              PrimaryTextField(
                  controller: provider.passwordController,
                  labelText: "Password",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password is required";
                    } else if (value.trim().length < 6) {
                      return "Password must be greater than 6";
                    }
                    return null;
                  }),
              const GapWidget(
                size: 0.0,
              ),

              //password confirm  form
              PrimaryTextField(
                  controller: provider.cPasswordController,
                  labelText: "Confirm Password",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Confirm your password";
                    } else if (provider.passwordController.text !=
                        value.trim()) {
                      return "Your password and confirmation is not match";
                    } else if (value.trim().length < 6) {
                      return "Password must be greater than 6";
                    }
                    return null;
                  }),

              const GapWidget(
                size: 0.0,
              ),
              PrimaryButton(
                buttonTitle:
                    (provider.isLoading) ? "......." : "Create Account",
                onPressed: provider.createAccount,
              ),
              const GapWidget(
                size: 0.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already hava account?', style: TextStyles.body2),
                  const GapWidget(
                    size: 0.0,
                  ),
                  LinkButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    buttonTitle: "Log In",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
