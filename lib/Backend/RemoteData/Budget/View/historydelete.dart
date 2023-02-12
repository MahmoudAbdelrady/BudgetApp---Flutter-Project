import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class HistoryDeleteData {
  Crud crud;
  HistoryDeleteData(this.crud);
  postData(String userid, String transID, String quantity, String type) async {
    var response = await crud.postData(AppApiLinks.linkdeletehistory, {
      "User_ID": userid,
      "TransactionID": transID,
      "Quantity": quantity,
      "Type": type
    });
    return response.fold((l) => l, (r) => r);
  }
}
