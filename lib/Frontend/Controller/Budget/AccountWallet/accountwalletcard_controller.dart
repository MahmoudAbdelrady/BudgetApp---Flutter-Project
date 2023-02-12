import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/AccountWallet/deleteaccountwallet.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class AccountWalletCardController extends GetxController {
  String? awName;
  String? awType;
  MyServices myServices = Get.find();
  editAW() async {}
  deleteAW() async {
    DeleteAccountWalletData deleteAccountWalletData =
        DeleteAccountWalletData(Get.find());
    var response = await deleteAccountWalletData.postData(
        awName!, myServices.sharedPreferences.getString("id")!);
    if (response['status'] == "success") {
      update();
    }
  }
}
