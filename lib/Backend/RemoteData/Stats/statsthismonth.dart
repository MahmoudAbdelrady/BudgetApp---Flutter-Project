import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class StatsThisMonthData {
  Crud crud;
  StatsThisMonthData(this.crud);
  postData(String userid) async {
    var response = await crud
        .postData(AppApiLinks.linkstatsthismonth, {"User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
