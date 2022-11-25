import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class ViewExpIncData {
  Crud crud;
  ViewExpIncData(this.crud);
  postData(String userid) async {
    var response = await crud
        .postData(AppApiLinks.linkviewexpinc, {"Budget_UserID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
