import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);
  postData(String email, String code) async {
    var response = await crud.postData(
        AppApiLinks.linkverifycode, {"Email": email, "User_VerifyCode": code});
    return response.fold((l) => l, (r) => r);
  }
}
