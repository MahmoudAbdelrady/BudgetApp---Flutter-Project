import 'package:get/get.dart';

class AccountWalletDialogTabController extends GetxController {
  late int selectedTab;

  changeTab(String tab) {
    selectedTab = tab == "New account/wallet".tr ? 0 : 1;
    update();
  }

  @override
  void onInit() {
    selectedTab = 0;
    super.onInit();
  }
}
