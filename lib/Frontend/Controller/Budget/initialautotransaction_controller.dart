import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/addtransaction.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/modifyautotransactiondate.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/viewautotransactions.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class InitialAutoTransactionController extends GetxController {
  late TextEditingController transTitle;
  late TextEditingController transTitleType;
  late TextEditingController transAmount;
  String transType = "Choose transaction type";
  late TextEditingController? transDate;
  AddTransactionData addTransactionData = AddTransactionData(Get.find());
  ViewAutoTransactionsData viewAutoTransactionsData =
      ViewAutoTransactionsData(Get.find());
  ModifyAutoTransactionDateData modifyAutoTransactionDateData =
      ModifyAutoTransactionDateData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List userAutoTransactions = [];
  addTransaction() async {
    var response = await addTransactionData.postData(
        myServices.sharedPreferences.getString("id")!,
        transTitle.text,
        transTitleType.text,
        transAmount.text,
        transType,
        transDate!.text);
    if (response['status'] == "success") {}
  }

  modifyAutoTransactionDate(
      String autoTransID, String actionRate, String actionAmount) async {
    await modifyAutoTransactionDateData.postData(
        myServices.sharedPreferences.getString("id")!,
        autoTransID,
        actionRate,
        actionAmount);
  }

  viewAutoTransactions() async {
    userAutoTransactions.clear();
    var response = await viewAutoTransactionsData.postData(
        myServices.sharedPreferences.getString("id")!, "All");
    if (response['status'] == "success") {
      userAutoTransactions.addAll(response['data']);
    }
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
