import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/history_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class HistoryBar extends GetView<HistoryController> {
  const HistoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: GetBuilder<HistoryController>(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  controller.changeHistory("All");
                },
                child: controller.selectedHistory == "All"
                    ? Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.buttonscolor,
                                    width: 5.0))),
                        child: Text(
                          "All".tr,
                          style: const TextStyle(
                              fontSize: 17,
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Text(
                        "All".tr,
                        style: const TextStyle(
                            fontSize: 17,
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.bold),
                      )),
            InkWell(
                onTap: () {
                  controller.changeHistory("Expence");
                },
                child: controller.selectedHistory == "Expence"
                    ? Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.buttonscolor,
                                    width: 5.0))),
                        child: Text(
                          "Expence".tr,
                          style: const TextStyle(
                              fontSize: 17,
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Text(
                        "Expence".tr,
                        style: const TextStyle(
                            fontSize: 17,
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.bold),
                      )),
            InkWell(
                onTap: () {
                  controller.changeHistory("Income");
                },
                child: controller.selectedHistory == "Income"
                    ? Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.buttonscolor,
                                    width: 5.0))),
                        child: Text(
                          "Income".tr,
                          style: const TextStyle(
                              fontSize: 17,
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Text(
                        "Income".tr,
                        style: const TextStyle(
                            fontSize: 17,
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.bold),
                      )),
          ],
        );
      }),
    );
  }
}
