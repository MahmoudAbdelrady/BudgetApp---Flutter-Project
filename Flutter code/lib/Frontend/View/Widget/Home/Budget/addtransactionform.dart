import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/addtransaction_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/history_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/Model/accountwalletmodel.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/transactionbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/transactiontextfield.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:intl/intl.dart';

class AddTransactionForm extends StatelessWidget {
  const AddTransactionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddTransactionController());
    List options = ["ChooseTypeNo".tr, "Bank Account".tr, "Wallet".tr];
    HistoryController historyController = Get.put(HistoryController());
    return GetBuilder<AddTransactionController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formstate,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TransactionTextField(
                  textboxTitle: "Title".tr,
                  textboxController: controller.transTitle,
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
                      value: controller.awData == "" ? null : controller.awData,
                    ),
                  ),
                ),
                TransactionTextField(
                  textboxTitle: "Amount".tr,
                  textboxType: "num",
                  textboxController: controller.transAmount,
                ),
                /*TransactionTextField(
            textboxTitle: "Transaction Type",
            textboxController: controller.transType,
          ),*/
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
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controller.transDate!,
                    validator: (value) => inputValidator(
                        value!.toString(), 1, 255, "transaction"),
                    decoration: InputDecoration(
                      label: Text(
                        "Transaction date".tr,
                        style: const TextStyle(color: AppColors.primarycolor),
                      ),
                      icon: const Icon(Icons.calendar_month_outlined,
                          color: AppColors.primarycolor),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: AppColors.primarycolor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: AppColors.buttonscolor),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          builder: (context, child) => Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                      primary: AppColors.primarycolor,
                                      onPrimary: Colors.white,
                                      onSurface: Colors.black)),
                              child: child!),
                          confirmText: "Confirm".tr,
                          cancelText: "Cancel".tr,
                          helpText: "Select Date".tr,
                          fieldLabelText: "Enter Date".tr,
                          fieldHintText: "mm/dd/yyyy".tr,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        controller.transDate!.text =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                      } else {
                        Get.defaultDialog(
                          title: "Alert".tr,
                          content: Text("transDateAlert".tr),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.buttonscolor),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("Ok".tr))
                          ],
                        );
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TransactionButton(
                        transonPressed: () async {
                          await controller.addTransaction();
                          historyController.getHistory("All");
                        },
                        transBtnTitle: "Save".tr,
                        btnColor: Colors.green),
                    TransactionButton(
                        transonPressed: () {
                          controller.clearFields();
                        },
                        transBtnTitle: "Clear".tr,
                        btnColor: AppColors.buttonscolor)
                  ],
                )
              ]),
            )));
  }
}
