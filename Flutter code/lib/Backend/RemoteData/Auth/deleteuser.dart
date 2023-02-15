import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class DeleteUserData {
  Crud crud;
  DeleteUserData(this.crud);
  postData(String email) async {
    var response =
        await crud.postData(AppApiLinks.linkdeleteuser, {"Email": email});
    return response.fold((l) => l, (r) => r);
  }
}
