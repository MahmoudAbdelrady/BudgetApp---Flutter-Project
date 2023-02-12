import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/addautotransaction_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/history_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/transactionbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/transactiontextfield.dart';

class AutoTransactionForm extends StatelessWidget {
  const AutoTransactionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAutoTransactionController());
    HistoryController historyController = Get.put(HistoryController());
    return GetBuilder<AddAutoTransactionController>(
        builder: (controller) => Form(
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
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controller.actionDate,
                    validator: (value) => inputValidator(
                        value!.toString(), 1, 255, "transaction"),
                    decoration: InputDecoration(
                      label: Text(
                        "Start date".tr,
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
                        controller.actionDate.text =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                      } else {
                        Get.defaultDialog(
                            title: "Alert".tr,
                            content: Text("startDateAlert".tr),
                            textConfirm: "Ok".tr,
                            onConfirm: () => Get.back());
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TransactionButton(
                        transonPressed: () async {
                          await controller.addAutoTransaction();
                          historyController.getHistory("All");
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
  }
}
