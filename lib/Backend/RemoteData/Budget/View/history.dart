import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class HistoryData {
  Crud crud;
  HistoryData(this.crud);
  postData(String userid, String type, String date) async {
    var response = await crud.postData(AppApiLinks.linkhistory,
        {"User_ID": userid, "Type": type, "Date": date});
    return response.fold((l) => l, (r) => r);
  }
}
