import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class HistoryDeleteData {
  Crud crud;
  HistoryDeleteData(this.crud);
  postData(String userid, String awName, String awType, String transID,
      String quantity, String type) async {
    var response = await crud.postData(AppApiLinks.linkdeletehistory, {
      "User_ID": userid,
      "AW_Name": awName,
      "AW_Type": awType,
      "TransactionID": transID,
      "Quantity": quantity,
      "Type": type
    });
    return response.fold((l) => l, (r) => r);
  }
}
