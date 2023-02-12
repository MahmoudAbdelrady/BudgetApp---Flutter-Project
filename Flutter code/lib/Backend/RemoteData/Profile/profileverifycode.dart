import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class ProfileVerifyCodeData {
  Crud crud;
  ProfileVerifyCodeData(this.crud);
  postData(String userid, String verifycode) async {
    var response = await crud.postData(AppApiLinks.linkprofileverifycode,
        {"User_ID": userid, "User_VerifyCode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
