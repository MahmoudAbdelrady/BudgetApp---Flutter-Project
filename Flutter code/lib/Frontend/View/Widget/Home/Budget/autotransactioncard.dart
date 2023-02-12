import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/autotransactions_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/editautotransaction_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Model/autotransactionmodel.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/editautotransaction.dart';

class AutoTransactionCard extends StatelessWidget {
  const AutoTransactionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AutoTransactionsController());
    EditAutoTransactionController editAutoTransactionController =
        Get.put(EditAutoTransactionController());
    return GetBuilder<AutoTransactionsController>(builder: (controller) {
      return Expanded(
          child: ListView.builder(
        itemCount: controller.autoTransactions.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Flexible(
                  child: ListTile(
                title: Text(
                  "${AutoTransactionModel.fromJson(controller.autoTransactions[index]).title}",
                  style: const TextStyle(
                      color: AppColors.primarycolor, fontSize: 17),
                ),
                subtitle: Text(AutoTransactionModel.fromJson(
                        controller.autoTransactions[index])
                    .actionRate!
                    .tr),
                trailing: Text(
                  "${AutoTransactionModel.fromJson(controller.autoTransactions[index]).amount}\$",
                  style: const TextStyle(
                      color: AppColors.thirdcolor, fontSize: 17),
                ),
              )),
              InkWell(
                  onTap: () {
                    editAutoTransactionController.updateControllerValues(
                        AutoTransactionModel.fromJson(
                                controller.autoTransactions[index])
                            .title!,
                        AutoTransactionModel.fromJson(
                                controller.autoTransactions[index])
                            .titleType!,
                        AutoTransactionModel.fromJson(
                                controller.autoTransactions[index])
                            .amount!,
                        AutoTransactionModel.fromJson(
                                controller.autoTransactions[index])
                            .type!,
                        AutoTransactionModel.fromJson(
                                controller.autoTransactions[index])
                            .actionRate!,
                        AutoTransactionModel.fromJson(
                                controller.autoTransactions[index])
                            .autoTransID!
                            .toString(),
                        AutoTransactionModel.fromJson(
                                controller.autoTransactions[index])
                            .actionDate!);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text("EditAT".tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColors.primarycolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                          content: const EditAutoTransaction(),
                        );
                      },
                    );
                    // controller.getAW(controller.selectedTab);
                  },
                  child: const Icon(
                    Icons.border_color_rounded,
                    color: Colors.green,
                  )),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: "Alert".tr,
                      middleText: "delAutoT".tr,
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.buttonscolor),
                            onPressed: () async {
                              controller.autoTransID =
                                  AutoTransactionModel.fromJson(
                                          controller.autoTransactions[index])
                                      .autoTransID!
                                      .toString();
                              await controller.deleteAutoTransaction();
                              controller.viewAutoTransactions(
                                  controller.selectedType == 0
                                      ? "All"
                                      : controller.selectedType == 1
                                          ? "Income"
                                          : "Expence");
                              Get.back();
                            },
                            child: Text("Yes".tr)),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondarycolor),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("No".tr))
                      ],
                    );
                  },
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                    size: 30,
                  )),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ));
    });
  }
}
