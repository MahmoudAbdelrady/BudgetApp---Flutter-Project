import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class ModifyAutoTransactionDateData {
  Crud crud;
  ModifyAutoTransactionDateData(this.crud);
  postData(String userID, String title, String actionRate,
      String actionAmount) async {
    var response =
        await crud.postData(AppApiLinks.linkmodifyautotransactiondate, {
      "User_ID": userID,
      "Title": title,
      "ActionRate": actionRate,
      "ActionAmount": actionAmount
    });
    return response.fold((l) => l, (r) => r);
  }
}
