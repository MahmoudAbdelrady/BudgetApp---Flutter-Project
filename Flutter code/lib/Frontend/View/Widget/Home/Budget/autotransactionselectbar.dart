import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/autotransactions_controller.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/budgetselectbarcontainer.dart';

class AutoTransactionsSelectBar extends StatelessWidget {
  const AutoTransactionsSelectBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AutoTransactionsController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<AutoTransactionsController>(builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BudgetSelectBarContainer(
                title: "All".tr,
                selected: controller.selectedType == 0 ? true : false,
                conatinerOnTap: () {
                  controller.changeAutoTransType(0);
                }),
            const VerticalDivider(
              width: 26,
              color: Colors.black,
              thickness: 0.5,
            ),
            BudgetSelectBarContainer(
                title: "Income".tr,
                selected: controller.selectedType == 1 ? true : false,
                conatinerOnTap: () {
                  controller.changeAutoTransType(1);
                }),
            const VerticalDivider(
              width: 26,
              color: Colors.black,
              thickness: 0.5,
            ),
            BudgetSelectBarContainer(
                title: "Expence".tr,
                selected: controller.selectedType == 2 ? true : false,
                conatinerOnTap: () {
                  controller.changeAutoTransType(2);
                }),
          ],
        );
      }),
    );
  }
}
