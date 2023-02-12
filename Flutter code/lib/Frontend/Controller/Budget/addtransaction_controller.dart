import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/addtransaction.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class AddTransactionController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController transTitle;
  late TextEditingController transTitleType;
  late TextEditingController transAmount;
  String transType = "Choose transaction type".tr;
  late TextEditingController? transDate;
  bool fstate = true;
  AddTransactionData addTransactionData = AddTransactionData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  addTransaction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (transType != "Choose transaction type".tr) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await addTransactionData.postData(
            myServices.sharedPreferences.getString("id")!,
            transTitle.text,
            transTitleType.text,
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
            middleText: "ChooseTypeAlert".tr,
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

  clearFields() {
    transTitle.clear();
    transTitleType.clear();
    transAmount.clear();
    transDate!.clear();
    changeTransType("Choose transaction type".tr);
    fstate = true;
    update();
  }

  @override
  void onInit() {
    transTitle = TextEditingController();
    transTitleType = TextEditingController();
    transAmount = TextEditingController();
    transDate = TextEditingController();
    super.onInit();
  }
}
