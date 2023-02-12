import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/deleteautotransaction.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/viewautotransactions.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class AutoTransactionsController extends GetxController {
  MyServices myServices = Get.find();
  int? selectedType;
  String autoTransID = "";
  List autoTransactions = [];
  ViewAutoTransactionsData viewAutoTransactionsData =
      ViewAutoTransactionsData(Get.find());
  DeleteAutoTransactionData deleteAutoTransactionData =
      DeleteAutoTransactionData(Get.find());
  viewAutoTransactions(String autoType) async {
    autoTransactions.clear();
    var response = await viewAutoTransactionsData.postData(
        myServices.sharedPreferences.getString("id")!, autoType);
    if (response['status'] == "success") {
      autoTransactions.addAll(response['data']);
    }
    update();
  }

  deleteAutoTransaction() async {
    var response = await deleteAutoTransactionData.postData(autoTransID);
    if (response['status'] == "success") {
      update();
    }
  }

  changeAutoTransType(int type) {
    selectedType = type;
    viewAutoTransactions(selectedType! == 0
        ? "All"
        : selectedType! == 1
            ? "Income"
            : "Expence");
    update();
  }

  @override
  void onInit() {
    selectedType = 0;
    viewAutoTransactions("All");
    super.onInit();
  }
}
