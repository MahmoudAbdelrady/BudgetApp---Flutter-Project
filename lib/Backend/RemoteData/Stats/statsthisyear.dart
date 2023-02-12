import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class StatsThisYearData {
  Crud crud;
  StatsThisYearData(this.crud);
  postData(String userid) async {
    var response =
        await crud.postData(AppApiLinks.linkstatsthisyear, {"User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
