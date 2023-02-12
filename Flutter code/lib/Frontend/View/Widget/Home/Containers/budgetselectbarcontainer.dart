import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class BudgetSelectBarContainer extends StatelessWidget {
  final String title;
  final bool selected;
  final void Function() conatinerOnTap;
  const BudgetSelectBarContainer(
      {Key? key,
      required this.selected,
      required this.conatinerOnTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 85,
      decoration: selected == true
          ? BoxDecoration(
              color: AppColors.primarycolor,
              borderRadius: BorderRadius.circular(50))
          : null,
      child: InkWell(
        onTap: conatinerOnTap,
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
