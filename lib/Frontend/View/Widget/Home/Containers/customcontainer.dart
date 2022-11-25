import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double contHeight;
  final Widget contChild;
  const CustomContainer(
      {Key? key, required this.contHeight, required this.contChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      height: contHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: contChild,
    );
  }
}
