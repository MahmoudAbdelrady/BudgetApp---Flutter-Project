import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String username, String email, String phone, String password) async {
    var response = await crud.postData(AppApiLinks.linksignup, {
      "Username": username,
      "Email": email,
      "Phone": phone,
      "Password": password
    });
    return response.fold((l) => l, (r) => r);
  }
}
