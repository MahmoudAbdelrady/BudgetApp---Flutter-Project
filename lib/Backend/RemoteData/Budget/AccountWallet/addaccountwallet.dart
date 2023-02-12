import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class AddAccountWalletData {
  Crud crud;
  AddAccountWalletData(this.crud);
  postData(String name, String amount, String type, String userid) async {
    var response = await crud.postData(AppApiLinks.linkaddaccountwallet,
        {"Name": name, "Amount": amount, "Type": type, "User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
