import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class CustomButtomAppBarButton extends StatelessWidget {
  final String pageTitle;
  final IconData pageIcon;
  final bool active;
  final void Function()? appBaronPressed;
  const CustomButtomAppBarButton(
      {Key? key,
      required this.pageTitle,
      required this.pageIcon,
      required this.active,
      this.appBaronPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: appBaronPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            pageIcon,
            size: 25,
            color: active == true
                ? AppColors.primarycolor
                : AppColors.secondarycolor,
          ),
          Text(
            pageTitle,
            style: TextStyle(
                color: active == true
                    ? AppColors.primarycolor
                    : AppColors.secondarycolor,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
