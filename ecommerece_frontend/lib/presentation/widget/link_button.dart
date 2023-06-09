// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:ecommerece_frontend/core/ui.dart';

class LinkButton extends StatelessWidget {
  final String buttonTitle;
  final Function()? onPressed;
  const LinkButton({
    Key? key,
    required this.buttonTitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Text(buttonTitle),
    );
  }
}
