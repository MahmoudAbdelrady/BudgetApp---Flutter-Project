import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class CustomContainerHeader extends StatelessWidget {
  final String headerText;
  const CustomContainerHeader({Key? key, required this.headerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(headerText,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: AppColors.primarycolor,
            fontSize: 18,
            fontWeight: FontWeight.bold));
  }
}
