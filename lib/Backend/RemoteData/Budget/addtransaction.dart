import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class AddTransactionData {
  Crud crud;
  AddTransactionData(this.crud);
  postData(String userid, String title, String titleType, String quantity,
      String type, String date) async {
    var response = await crud.postData(AppApiLinks.linkaddtransaction, {
      "User_ID": userid,
      "Title": title,
      "Title_Type": titleType,
      "Quantity": quantity,
      "Type": type,
      "Date": date
    });
    return response.fold((l) => l, (r) => r);
  }
}
