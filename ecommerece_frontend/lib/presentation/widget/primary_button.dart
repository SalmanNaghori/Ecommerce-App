// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:ecommerece_frontend/core/ui.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final Function()? onPressed;
  const PrimaryButton({
    Key? key,
    required this.buttonTitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        onPressed: onPressed,
        color: AppColors.accent,
        child: Text(buttonTitle),
      ),
    );
  }
}
