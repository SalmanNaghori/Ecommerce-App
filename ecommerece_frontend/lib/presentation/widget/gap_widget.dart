// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GapWidget extends StatelessWidget {
  final double size;
  const GapWidget({
    Key? key,
    this.size = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16 + size,
      width: 16 + size,
    );
  }
}
