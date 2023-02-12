import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class StatsThisWeekData {
  Crud crud;
  StatsThisWeekData(this.crud);
  postData(String userid) async {
    var response =
        await crud.postData(AppApiLinks.linkstatsthisweek, {"User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
