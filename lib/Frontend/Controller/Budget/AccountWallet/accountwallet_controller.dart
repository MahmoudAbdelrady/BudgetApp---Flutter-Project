import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/AccountWallet/viewaccountwallet.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class AccountWalletController extends GetxController {
  List awList = [];
  int selectedTab = 0;
  MyServices myServices = Get.find();
  ViewAccountWalletData viewAccountWalletData =
      ViewAccountWalletData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  getAW(int tabType) async {
    String type = tabType == 0 ? "Bank Account" : "Wallet";
    awList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewAccountWalletData.postData(
        myServices.sharedPreferences.getString("id")!, type);
    if (response['status'] == "success") {
      awList.addAll(response['data']);
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  changeTab(int tab) {
    selectedTab = tab;
    getAW(selectedTab);
    update();
  }

  @override
  void onInit() {
    getAW(0);
    super.onInit();
  }
}
