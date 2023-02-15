import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/autotransactions_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/editautotransaction_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Model/accountwalletmodel.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/transactionbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/transactiontextfield.dart';

class EditAutoTransaction extends StatelessWidget {
  const EditAutoTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditAutoTransactionController());
    AutoTransactionsController autoTransactionsController =
        Get.put(AutoTransactionsController());
    List options = ["ChooseTypeNo".tr, "Bank Account".tr, "Wallet".tr];
    return GetBuilder<EditAutoTransactionController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
              key: controller.formstate,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TransactionTextField(
                    textboxTitle: "Title".tr,
                    textboxController: controller.title,
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: controller.awType != "ChooseTypeNo".tr
                                  ? AppColors.buttonscolor
                                  : AppColors.primarycolor)),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: options
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      e,
                                      textAlign: TextAlign.center,
                                    ))))
                            .toList(),
                        onChanged: (value) {
                          controller.changeAWType(value.toString());
                          value.toString() == "ChooseTypeNo".tr
                              ? null
                              : controller
                                  .getAW(options.indexOf(value.toString()));
                          /*accountWalletController
                              .getAW(options.indexOf(value.toString()));*/
                        },
                        value: controller.awType,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: controller.awData != "" &&
                                      controller.awData !=
                                          "Choose bank account/wallet".tr
                                  ? AppColors.buttonscolor
                                  : AppColors.primarycolor)),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: controller.awList
                            .map((e) => DropdownMenuItem(
                                  value: e is String
                                      ? e
                                      : AccountWalletModel.fromJson(e).name,
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        e is String
                                            ? e
                                            : AccountWalletModel.fromJson(e)
                                                .name!,
                                        textAlign: TextAlign.center,
                                      )),
                                ))
                            .toList(),
                        onChanged: controller.awList.length <= 1
                            ? null
                            : (val) {
                                controller.changeAWData(val.toString());
                              },
                        value:
                            controller.awData == "" ? null : controller.awData,
                      ),
                    ),
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
                              color: controller.transType !=
                                      "Choose transaction type".tr
                                  ? AppColors.buttonscolor
                                  : AppColors.primarycolor)),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: [
                          "Choose transaction type".tr,
                          "IncomeNoThe".tr,
                          "ExpenceNoThe".tr
                        ]
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
                              color: controller.actionRate != "Choose rate".tr
                                  ? AppColors.buttonscolor
                                  : AppColors.primarycolor)),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: [
                          "Choose rate".tr,
                          "Daily".tr,
                          "Weekly".tr,
                          "Monthly".tr,
                          "Yearly".tr
                        ]
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
                                    : autoTransactionsController.selectedType ==
                                            1
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
              )));
    });
  }
}
