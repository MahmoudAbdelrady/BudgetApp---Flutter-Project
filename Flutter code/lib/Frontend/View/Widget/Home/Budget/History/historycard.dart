import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/history_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Model/historymodel.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customdivider.dart';

class HistoryCard extends GetView<HistoryController> {
  final bool home;
  const HistoryCard(this.home, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (context) {
      return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: home == true
              ? controller.historyDatalist.length > 3
                  ? 3 * 75
                  : controller.historyDatalist.length * 75
              : controller.historyDatalist.length * 75,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: ListView.builder(
            itemCount: home == true
                ? controller.historyDatalist.length > 3
                    ? 3
                    : controller.historyDatalist.length
                : controller.historyDatalist.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
              children: [
                Flexible(
                  child: ListTile(
                    // title: Text("Pizza"),
                    title: Text(
                        "${HistoryModel.fromJson(controller.historyDatalist[index]).title}"),
                    subtitle: Text(
                        "${HistoryModel.fromJson(controller.historyDatalist[index]).titleType}"),
                    trailing: HistoryModel.fromJson(
                                    controller.historyDatalist[index])
                                .type ==
                            "Expence"
                        ? Text(
                            "-${HistoryModel.fromJson(controller.historyDatalist[index]).quantity}\$",
                            style: const TextStyle(color: Colors.red))
                        : Text(
                            "+${HistoryModel.fromJson(controller.historyDatalist[index]).quantity}\$",
                            style: const TextStyle(color: Colors.green)),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: "Alert".tr,
                          middleText: "transDelete".tr,
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.buttonscolor),
                                onPressed: () async {
                                  Get.back();
                                  controller.transID = HistoryModel.fromJson(
                                          controller.historyDatalist[index])
                                      .transactionID
                                      .toString();
                                  controller.quantity = HistoryModel.fromJson(
                                          controller.historyDatalist[index])
                                      .quantity
                                      .toString();
                                  controller.type = HistoryModel.fromJson(
                                          controller.historyDatalist[index])
                                      .type;
                                  await controller.deleteHistory();
                                  controller
                                      .getHistory(controller.selectedHistory!);
                                },
                                child: Text("Yes".tr)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.secondarycolor),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("No".tr))
                          ]);
                    },
                    child: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                      size: 30,
                    )),
                const CustomDivider(marginWidth: 5),
              ],
            ),
          ));
    });
  }
}
