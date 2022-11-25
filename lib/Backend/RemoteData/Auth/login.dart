import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String username, String password) async {
    var response = await crud.postData(AppApiLinks.linklogin, {
      "Username": username,
      "Password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
