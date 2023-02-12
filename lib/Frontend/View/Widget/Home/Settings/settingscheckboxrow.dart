import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class SettingsCheckBoxRow extends StatelessWidget {
  final String title;
  final String rowType;
  final bool visible;
  const SettingsCheckBoxRow(
      {Key? key,
      required this.title,
      required this.rowType,
      required this.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return visible == true
        ? Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                activeColor: AppColors.buttonscolor,
                checkColor: AppColors.primarycolor,
                value: true,
                onChanged: (value) {},
              ),
              Text(
                title,
                style: TextStyle(
                    color: AppColors.primarycolor,
                    fontSize: rowType == "theme" ? 18 : 14,
                    fontWeight: rowType == "theme"
                        ? FontWeight.bold
                        : FontWeight.normal),
              )
            ],
          )
        : Text(title);
  }
}
