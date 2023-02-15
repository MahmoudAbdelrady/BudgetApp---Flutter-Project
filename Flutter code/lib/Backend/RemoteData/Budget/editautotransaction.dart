import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class EditAutoTransactionData {
  Crud crud;
  EditAutoTransactionData(this.crud);
  postData(String autoTransID, String userID, String awName, String awType,
      String title, String amount, String type, String actionRate) async {
    var response = await crud.postData(AppApiLinks.linkeditautotransaction, {
      "Auto_TransID": autoTransID,
      "User_ID": userID,
      "AW_Name": awName,
      "AW_Type": awType,
      "Title": title,
      "Amount": amount,
      "Type": type,
      "ActionRate": actionRate
    });
    return response.fold((l) => l, (r) => r);
  }
}
