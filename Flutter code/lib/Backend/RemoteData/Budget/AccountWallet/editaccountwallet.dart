import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class EditAccountWalletData {
  Crud crud;
  EditAccountWalletData(this.crud);
  postData(String name, String amount, String type, String userid,
      String awID) async {
    var response = await crud.postData(AppApiLinks.linkeditaccountwallet, {
      "Name": name,
      "Amount": amount,
      "Type": type,
      "User_ID": userid,
      "ID": awID
    });
    return response.fold((l) => l, (r) => r);
  }
}
