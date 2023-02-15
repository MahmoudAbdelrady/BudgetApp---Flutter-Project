import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/View/history.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/View/historydelete.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class HistoryController extends GetxController {
  String? awName;
  String? awType;
  String? transID;
  String? quantity;
  String? type;
  HistoryData historyData = HistoryData(Get.find());
  HistoryDeleteData historyDeleteData = HistoryDeleteData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  /*List allHistory = [];
  List incomeHistory = [];
  List expenceHistory = [];*/
  List historyDatalist = [];
  String? selectedHistory;
  getHistory(String type) async {
    historyDatalist.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await historyData.postData(
        myServices.sharedPreferences.getString("id")!, type);
    if (response['status'] == "success") {
      statusRequest = StatusRequest.success;
      historyDatalist.addAll(response['data']);
    } else {
      statusRequest = StatusRequest.empty;
    }
    update();
  }

  deleteHistory() async {
    var response = await historyDeleteData.postData(
        myServices.sharedPreferences.getString("id")!,
        awName!,
        awType!,
        transID!,
        quantity!,
        type!);
    if (response['status'] == "success") {
      update();
    }
  }

  changeHistory(String h) {
    selectedHistory = h;
    getHistory(h);
    update();
  }

  @override
  void onInit() {
    selectedHistory = "All";
    getHistory(selectedHistory!);
    super.onInit();
  }
}
