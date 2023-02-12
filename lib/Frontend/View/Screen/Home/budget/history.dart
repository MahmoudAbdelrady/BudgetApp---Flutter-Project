import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/history_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/History/historybar.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/History/historycard.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 250),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.primarycolor,
                  )),
              SizedBox(width: MediaQuery.of(context).size.width / 3.5),
              Text(
                "History".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: AppColors.primarycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          const HistoryBar(),
          Expanded(
              child: ListView(
            children: const [
              HistoryCard(false),
            ],
          )),
        ],
      )),
    );
  }
}
