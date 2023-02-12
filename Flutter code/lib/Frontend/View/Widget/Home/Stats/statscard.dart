import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class StatsCard extends StatelessWidget {
  final String cardTitle;
  final String cardValue;
  const StatsCard({Key? key, required this.cardTitle, required this.cardValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 170,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                cardTitle,
                style: const TextStyle(
                    color: AppColors.primarycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              Text(
                cardValue,
                style: TextStyle(
                    color: cardTitle == "Income".tr ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
