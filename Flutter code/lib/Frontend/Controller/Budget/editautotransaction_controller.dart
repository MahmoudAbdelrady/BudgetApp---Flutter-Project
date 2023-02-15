import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/AccountWallet/viewaccountwallet.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/editautotransaction.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class EditAutoTransactionController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController amount;
  late TextEditingController actionDate;
  String autoTransID = "";
  String transType = "Choose transaction type".tr;
  String awType = "ChooseTypeNo".tr;
  // String awData = "Choose bank account/wallet".tr;
  String awData = "";
  String actionRate = "Choose rate".tr;
  List awList = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  EditAutoTransactionData editAutoTransactionData =
      EditAutoTransactionData(Get.find());
  ViewAccountWalletData viewAccountWalletData =
      ViewAccountWalletData(Get.find());
  editAutoTransaction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (transType != "Choose transaction type".tr &&
          awType != "ChooseTypeNo".tr &&
          (awData != "" && awData != "Choose bank account/wallet".tr) &&
          actionRate != "Choose rate".tr) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await editAutoTransactionData.postData(
            autoTransID,
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
                        : "Yearly");
        if (response['status'] == "success") {
          statusRequest = StatusRequest.success;
          Get.back();
          Get.defaultDialog(
              title: "Status".tr,
              middleText: "AutoTransEditSuccess".tr,
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
              title: "Alert".tr,
              middleText: "AutoTransEditFail".tr,
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonscolor),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Ok".tr))
              ]);
          statusRequest = StatusRequest.failure;
        }
        update();
      } else {
        Get.defaultDialog(
            title: "Alert".tr,
            content: Text("ChooseTypeAlert".tr),
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
    update();
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

  clearFields() {
    title.clear();
    amount.clear();
    changeTransType("Choose transaction type".tr);
    changeAWType("ChooseTypeNo".tr);
    changeAWData("");
    awList.clear();
    changeRate("Choose rate".tr);
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

  updateControllerValues(
      String autoTitle,
      String acwaType,
      String acwaData,
      String autoAmount,
      String autoTransType,
      String autoRate,
      String autoTransID,
      String autoTransDate) {
    title.text = autoTitle;
    awType = acwaType;
    awData = acwaData;
    getAW(awType == "Bank Account".tr ? 1 : 2);
    amount.text = autoAmount;
    transType = autoTransType;
    actionRate = autoRate;
    autoTransID = autoTransID;
    actionDate.text = autoTransDate;
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
