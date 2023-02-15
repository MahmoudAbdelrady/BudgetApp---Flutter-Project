import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/AccountWallet/viewaccountwallet.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/addtransaction.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class AddTransactionController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController transTitle;
  late TextEditingController transAmount;
  String transType = "Choose transaction type".tr;
  String awType = "ChooseTypeNo".tr;
  // String awData = "Choose bank account/wallet".tr;
  String awData = "";
  late TextEditingController? transDate;
  bool fstate = true;
  List awList = [];
  AddTransactionData addTransactionData = AddTransactionData(Get.find());
  ViewAccountWalletData viewAccountWalletData =
      ViewAccountWalletData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  addTransaction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (transType != "Choose transaction type".tr &&
          awType != "ChooseTypeNo".tr &&
          (awData != "" && awData != "Choose bank account/wallet".tr)) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await addTransactionData.postData(
            myServices.sharedPreferences.getString("id")!,
            transTitle.text,
            awData,
            awType == "Bank Account".tr ? "Bank Account" : "Wallet",
            transAmount.text,
            transType == "IncomeNoThe".tr ? "Income" : "Expence",
            transDate!.text);
        if (response['status'] == "success") {
          statusRequest = StatusRequest.success;
          clearFields();
          Get.back();
          Get.defaultDialog(
            title: "Status".tr,
            middleText: "TransAddSuccess".tr,
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
        } else {
          Get.defaultDialog(
              title: "Alert".tr,
              middleText: "TransAddFail".tr,
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
            middleText: "CorrectTypeAlert".tr,
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonscolor),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Ok".tr))
            ]);
        fstate = false;
        update();
      }
    } else {
      fstate = false;
      update();
    }
  }

  changeTransType(String type) {
    transType = type;
    update();
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

  changeAWType(String type) {
    awType = type;
    update();
  }

  changeAWData(String aw) {
    awData = aw;
    update();
  }

  clearFields() {
    transTitle.clear();
    transAmount.clear();
    transDate!.clear();
    changeTransType("Choose transaction type".tr);
    changeAWType("ChooseTypeNo".tr);
    changeAWData("");
    awList.clear();
    fstate = true;
    update();
  }

  @override
  void onInit() {
    transTitle = TextEditingController();
    transAmount = TextEditingController();
    transDate = TextEditingController();
    super.onInit();
  }
}
