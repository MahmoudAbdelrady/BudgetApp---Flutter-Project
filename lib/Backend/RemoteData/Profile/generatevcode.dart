import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class GenerateVCodeData {
  Crud crud;
  GenerateVCodeData(this.crud);
  postData(String userid) async {
    var response =
        await crud.postData(AppApiLinks.linkgeneratecode, {"User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
