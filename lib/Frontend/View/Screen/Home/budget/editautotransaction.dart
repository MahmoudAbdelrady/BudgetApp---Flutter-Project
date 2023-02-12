import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/autotransactions_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/editautotransaction_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/transactionbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/transactiontextfield.dart';

class EditAutoTransaction extends StatelessWidget {
  const EditAutoTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditAutoTransactionController());
    AutoTransactionsController autoTransactionsController =
        Get.put(AutoTransactionsController());
    return GetBuilder<EditAutoTransactionController>(builder: (controller) {
      return Form(
          key: controller.formstate,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TransactionTextField(
                textboxTitle: "Title".tr,
                textboxController: controller.title,
              ),
              TransactionTextField(
                textboxTitle: "Title type".tr,
                textboxController: controller.titleType,
              ),
              TransactionTextField(
                textboxTitle: "Amount".tr,
                textboxType: "num",
                textboxController: controller.amount,
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color:
                              controller.transType != "Choose transaction type"
                                  ? AppColors.buttonscolor
                                  : AppColors.primarycolor)),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: ["Choose transaction type", "Income", "Expence"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    e,
                                    textAlign: TextAlign.center,
                                  )),
                            ))
                        .toList(),
                    onChanged: (val) {
                      controller.changeTransType(val.toString());
                    },
                    value: controller.transType,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: controller.actionRate != "Choose rate"
                              ? AppColors.buttonscolor
                              : AppColors.primarycolor)),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: const SizedBox(),
                    items:
                        ["Choose rate", "Daily", "Weekly", "Monthly", "Yearly"]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.center,
                                      )),
                                ))
                            .toList(),
                    onChanged: (val) {
                      controller.changeRate(val.toString());
                    },
                    value: controller.actionRate,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TransactionButton(
                      transonPressed: () async {
                        await controller.editAutoTransaction();
                        autoTransactionsController.viewAutoTransactions(
                            autoTransactionsController.selectedType == 0
                                ? "All"
                                : autoTransactionsController.selectedType == 1
                                    ? "Income"
                                    : "Expence");
                      },
                      transBtnTitle: "Save".tr,
                      btnColor: AppColors.buttonscolor),
                  TransactionButton(
                      transonPressed: () {
                        controller.clearFields();
                      },
                      transBtnTitle: "Clear".tr,
                      btnColor: Colors.green)
                ],
              )
            ],
          ));
    });
  }
}
