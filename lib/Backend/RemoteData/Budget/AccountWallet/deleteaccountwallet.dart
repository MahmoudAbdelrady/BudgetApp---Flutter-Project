import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class DeleteAccountWalletData {
  Crud crud;
  DeleteAccountWalletData(this.crud);
  postData(String name, String userid) async {
    var response = await crud.postData(
        AppApiLinks.linkdeleteaccountwallet, {"Name": name, "User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
