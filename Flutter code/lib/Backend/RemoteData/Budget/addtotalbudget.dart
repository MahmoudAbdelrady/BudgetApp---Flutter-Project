import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class AddTotalBudgetData {
  Crud crud;
  AddTotalBudgetData(this.crud);
  postData(String totalbudget, String userid) async {
    var response = await crud.postData(AppApiLinks.linkaddbudget,
        {"Total_Budget": totalbudget, "User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
