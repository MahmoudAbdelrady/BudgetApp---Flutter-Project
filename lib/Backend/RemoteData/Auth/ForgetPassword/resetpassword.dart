import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String email, String pass) async {
    var response = await crud.postData(
        AppApiLinks.linkresetpassword, {"Email": email, "Password": pass});

    return response.fold((l) => l, (r) => r);
  }
}
