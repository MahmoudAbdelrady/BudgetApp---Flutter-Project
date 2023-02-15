import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/AccountWallet/viewaccountwallet.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/addautotransaction.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/addtransaction.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/modifyautotransactiondate.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class AddAutoTransactionController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController amount;
  late TextEditingController actionDate;
  String? autoTransID;
  String transType = "Choose transaction type".tr;
  String actionRate = "Choose rate".tr;
  String awType = "ChooseTypeNo".tr;
  // String awData = "Choose bank account/wallet".tr;
  String awData = "";
  List awList = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  AddAutoTransactionData addAutoTransactionData =
      AddAutoTransactionData(Get.find());
  ViewAccountWalletData viewAccountWalletData =
      ViewAccountWalletData(Get.find());
  addAutoTransaction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (transType != "Choose transaction type".tr &&
          awType != "ChooseTypeNo".tr &&
          (awData != "" && awData != "Choose bank account/wallet".tr) &&
          actionRate != "Choose rate".tr) {
        statusRequest = StatusRequest.loading;
        update();
        print(awData);
        var response = await addAutoTransactionData.postData(
            myServices.sharedPreferences.getString("id")!,
            awData,
            awType == "Bank Account".tr ? "Bank Account" : "Wallet",
            title.text,
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
          statusRequest = StatusRequest.success;
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
                  awData,
                  awType == "Bank Account".tr ? "Bank Account" : "Wallet",
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
                  awData,
                  awType == "Bank Account".tr ? "Bank Account" : "Wallet",
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
                  awData,
                  awType == "Bank Account".tr ? "Bank Account" : "Wallet",
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
                  awData,
                  awType == "Bank Account".tr ? "Bank Account" : "Wallet",
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
                  awData,
                  awType == "Bank Account".tr ? "Bank Account" : "Wallet",
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
                  awData,
                  awType == "Bank Account".tr ? "Bank Account" : "Wallet",
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
                  awData,
                  awType == "Bank Account".tr ? "Bank Account" : "Wallet",
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
                  awData,
                  awType == "Bank Account".tr ? "Bank Account" : "Wallet",
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
          statusRequest = StatusRequest.none;
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

  getAW(int tabType) async {
    String type = tabType == 1 ? "Bank Account" : "Wallet";
    awList.clear();
    var response = await viewAccountWalletData.postData(
        myServices.sharedPreferences.getString("id")!, type);
    if (response['status'] == "success") {
      awList.addAll(response['data']);
      if (awList.length >= 2) {
        awList.insert(0, "Choose bank account/wallet".tr);
        awData = "Choose bank account/wallet".tr;
      } else if (awList.length == 1) {
        awData = awList[0]['Name'];
      }
    }
    update();
  }

  changeTransType(String type) {
    transType = type;
    update();
  }

  changeAWType(String type) {
    awType = type;
    update();
  }

  changeAWData(String aw) {
    awData = aw;
    update();
  }

  changeRate(String rate) {
    actionRate = rate;
    update();
  }

  clearFields() {
    title.clear();
    amount.clear();
    actionDate.clear();
    changeTransType("Choose transaction type".tr);
    changeAWType("ChooseTypeNo".tr);
    changeAWData("");
    awList.clear();
    changeRate("Choose rate".tr);
    update();
  }

  @override
  void onInit() {
    title = TextEditingController();
    amount = TextEditingController();
    actionDate = TextEditingController();
    super.onInit();
  }
}
