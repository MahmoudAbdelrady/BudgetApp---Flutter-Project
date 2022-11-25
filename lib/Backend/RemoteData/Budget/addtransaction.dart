import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class AddTransactionData {
  Crud crud;
  AddTransactionData(this.crud);
  postData(String userid, String title, String titleType, int quantity,
      String type) async {
    var response = await crud.postData(AppApiLinks.linkaddtransaction, {
      "User_ID": userid,
      "Title": title,
      "Title_Type": titleType,
      "Quantity": quantity,
      "Type": type
    });
    return response.fold((l) => l, (r) => r);
  }
}
