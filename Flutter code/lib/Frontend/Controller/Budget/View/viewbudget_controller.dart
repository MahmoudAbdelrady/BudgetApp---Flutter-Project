import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/View/viewbudget.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class ViewBudgetController extends GetxController {
  String budget = "0";
  ViewBudgetData viewBudgetData = ViewBudgetData(Get.find());
  MyServices myServices = Get.find();
  viewBudget() async {
    var response = await viewBudgetData
        .postData(myServices.sharedPreferences.getString("id")!);
    if (response['status'] == "success") {
      budget = response['data']['Total'].toString() == "null"
          ? "0"
          : response['data']['Total'].toString();
      update();
    }
  }
}
