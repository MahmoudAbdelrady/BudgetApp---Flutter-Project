import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class SelectBarTab extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool selected;
  const SelectBarTab(
      {Key? key,
      required this.title,
      required this.selected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 80,
      decoration: selected == true
          ? BoxDecoration(
              color: AppColors.primarycolor,
              borderRadius: BorderRadius.circular(50))
          : null,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color:
                      selected == true ? Colors.white : AppColors.primarycolor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
