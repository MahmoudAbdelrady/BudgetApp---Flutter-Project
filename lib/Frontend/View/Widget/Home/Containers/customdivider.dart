import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double marginWidth;
  const CustomDivider({Key? key, required this.marginWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginWidth),
      child: const Divider(
        height: 5,
        thickness: 2,
      ),
    );
  }
}
