import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class DeleteAccountWalletData {
  Crud crud;
  DeleteAccountWalletData(this.crud);
  postData(String name, String type, String userid) async {
    var response = await crud.postData(AppApiLinks.linkdeleteaccountwallet,
        {"Name": name, "Type": type, "User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
