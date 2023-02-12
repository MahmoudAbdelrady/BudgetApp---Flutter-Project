import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainer.dart';

class BudgetCustomCard extends StatelessWidget {
  final String cardTitle;
  final IconData cardIcon;
  final void Function() cardOnTap;
  const BudgetCustomCard(
      {Key? key,
      required this.cardTitle,
      required this.cardIcon,
      required this.cardOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        contHeight: 70,
        contChild: InkWell(
            onTap: cardOnTap,
            child: Row(
              children: [
                Expanded(
                    child: ListTile(
                  title: Text(
                    cardTitle,
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.primarycolor,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    cardIcon,
                    color: AppColors.primarycolor,
                  ),
                  trailing: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: AppColors.secondarycolor,
                  ),
                )),
              ],
            )));
  }
}
