import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class EditAutoTransactionData {
  Crud crud;
  EditAutoTransactionData(this.crud);
  postData(String autoTransID, String userID, String title, String titleType,
      String amount, String type, String actionRate) async {
    var response = await crud.postData(AppApiLinks.linkeditautotransaction, {
      "Auto_TransID": autoTransID,
      "User_ID": userID,
      "Title": title,
      "Title_Type": titleType,
      "Amount": amount,
      "Type": type,
      "ActionRate": actionRate
    });
    return response.fold((l) => l, (r) => r);
  }
}
