import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class ViewAutoTransactionsData {
  Crud crud;
  ViewAutoTransactionsData(this.crud);
  postData(String userid, String type) async {
    var response = await crud.postData(AppApiLinks.linkviewautotransactions,
        {"User_ID": userid, "Type": type});
    return response.fold((l) => l, (r) => r);
  }
}
