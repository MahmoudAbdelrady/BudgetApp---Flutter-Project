import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class AddAutoTransactionData {
  Crud crud;
  AddAutoTransactionData(this.crud);
  postData(String userid, String awName, String awType, String title,
      String amount, String type, String rate, String date) async {
    var response = await crud.postData(AppApiLinks.linkaddautotransaction, {
      "User_ID": userid,
      "AW_Name": awName,
      "AW_Type": awType,
      "Title": title,
      "Amount": amount,
      "Type": type,
      "ActionRate": rate,
      "ActionDate": date
    });
    return response.fold((l) => l, (r) => r);
  }
}
