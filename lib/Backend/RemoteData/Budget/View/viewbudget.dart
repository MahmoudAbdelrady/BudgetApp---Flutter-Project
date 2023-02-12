import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class ViewBudgetData {
  Crud crud;
  ViewBudgetData(this.crud);
  postData(String userid) async {
    var response =
        await crud.postData(AppApiLinks.linkviewbudget, {"User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
