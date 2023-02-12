import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/addautotransaction.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/addtransaction.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/deleteautotransaction.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/modifyautotransactiondate.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/viewautotransactions.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class AddAutoTransactionController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController titleType;
  late TextEditingController amount;
  late TextEditingController actionDate;
  String? autoTransID;
  String transType = "Choose transaction type".tr;
  String actionRate = "Choose rate".tr;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddAutoTransactionData addAutoTransactionData =
      AddAutoTransactionData(Get.find());
  ViewAutoTransactionsData viewAutoTransactionsData =
      ViewAutoTransactionsData(Get.find());
  DeleteAutoTransactionData deleteAutoTransactionData =
      DeleteAutoTransactionData(Get.find());
  addAutoTransaction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (transType != "Choose transaction type".tr &&
          actionRate != "Choose a rate".tr) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await addAutoTransactionData.postData(
            myServices.sharedPreferences.getString("id")!,
            title.text,
            titleType.text,
            amount.text,
            transType == "IncomeNoThe".tr ? "Income" : "Expence",
            actionRate == "Daily".tr
                ? "Daily"
                : actionRate == "Weekly".tr
                    ? "Weekly"
                    : actionRate == "Monthly".tr
                        ? "Monthly"
                        : "Yearly",
            actionDate.text);
        if (response['status'] == "success") {
          AddTransactionData addTransactionData =
              AddTransactionData(Get.find());
          String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
          if (actionRate == "Daily".tr) {
            int actionAmount = (DateTime.parse(currentDate)
                        .difference(DateTime.parse(actionDate.text))
                        .inHours /
                    24)
                .round();
            if (actionAmount >= 1) {
              ModifyAutoTransactionDateData modifyAutoTransactionDateData =
                  ModifyAutoTransactionDateData(Get.find());
              await addTransactionData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  titleType.text,
                  (actionAmount * double.parse(amount.text)).toString(),
                  transType == "IncomeNoThe".tr ? "Income" : "Expence",
                  actionDate.text);
              await modifyAutoTransactionDateData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  "DAY",
                  actionAmount.toString());
            } else {
              await addTransactionData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  titleType.text,
                  amount.text,
                  transType == "IncomeNoThe".tr ? "Income" : "Expence",
                  actionDate.text);
            }
          } else if (actionRate == "Weekly".tr) {
            int actionAmount = (DateTime.parse(currentDate)
                        .difference(DateTime.parse(actionDate.text))
                        .inDays /
                    7)
                .round();
            if (actionAmount >= 1) {
              ModifyAutoTransactionDateData modifyAutoTransactionDateData =
                  ModifyAutoTransactionDateData(Get.find());
              await addTransactionData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  titleType.text,
                  (actionAmount * double.parse(amount.text)).toString(),
                  transType == "IncomeNoThe".tr ? "Income" : "Expence",
                  actionDate.text);
              await modifyAutoTransactionDateData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  "WEEK",
                  actionAmount.toString());
            } else {
              await addTransactionData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  titleType.text,
                  amount.text,
                  transType == "IncomeNoThe".tr ? "Income" : "Expence",
                  actionDate.text);
            }
          } else if (actionRate == "Monthly".tr) {
            int actionAmount = (DateTime.parse(currentDate)
                        .difference(DateTime.parse(actionDate.text))
                        .inDays /
                    30)
                .round();
            if (actionAmount >= 1) {
              ModifyAutoTransactionDateData modifyAutoTransactionDateData =
                  ModifyAutoTransactionDateData(Get.find());
              await addTransactionData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  titleType.text,
                  (actionAmount * double.parse(amount.text)).toString(),
                  transType == "IncomeNoThe".tr ? "Income" : "Expence",
                  actionDate.text);
              await modifyAutoTransactionDateData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  "MONTH",
                  actionAmount.toString());
            } else {
              await addTransactionData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  titleType.text,
                  amount.text,
                  transType == "IncomeNoThe".tr ? "Income" : "Expence",
                  actionDate.text);
            }
          } else {
            int actionAmount = (DateTime.parse(currentDate)
                        .difference(DateTime.parse(actionDate.text))
                        .inDays /
                    365)
                .round();
            if (actionAmount >= 1) {
              ModifyAutoTransactionDateData modifyAutoTransactionDateData =
                  ModifyAutoTransactionDateData(Get.find());
              await addTransactionData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  titleType.text,
                  (actionAmount * double.parse(amount.text)).toString(),
                  transType == "IncomeNoThe".tr ? "Income" : "Expence",
                  actionDate.text);
              await modifyAutoTransactionDateData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  "YEAR",
                  actionAmount.toString());
            } else {
              await addTransactionData.postData(
                  myServices.sharedPreferences.getString("id")!,
                  title.text,
                  titleType.text,
                  amount.text,
                  transType == "IncomeNoThe".tr ? "Income" : "Expence",
                  actionDate.text);
            }
          }
          clearFields();
          Get.back();
          Get.defaultDialog(
              title: "Status".tr,
              content: Text("AutoTransAddSuccess".tr),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonscolor),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Ok".tr))
              ]);
        } else {
          Get.defaultDialog(
              title: "Status".tr,
              content: Text("AutoTransAddFail".tr),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonscolor),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Ok".tr))
              ]);
        }
        update();
      } else {
        Get.defaultDialog(
            title: "Alert".tr,
            content: Text("CorrectTypeAlert".tr),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonscolor),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Ok".tr))
            ]);
        update();
      }
    }
  }

  changeTransType(String type) {
    transType = type;
    update();
  }

  changeRate(String rate) {
    actionRate = rate;
    update();
  }

  clearFields() {
    title.clear();
    titleType.clear();
    amount.clear();
    actionDate.clear();
    changeTransType("Choose transaction type".tr);
    changeRate("Choose rate".tr);
    update();
  }

  @override
  void onInit() {
    title = TextEditingController();
    titleType = TextEditingController();
    amount = TextEditingController();
    actionDate = TextEditingController();
    super.onInit();
  }
}
