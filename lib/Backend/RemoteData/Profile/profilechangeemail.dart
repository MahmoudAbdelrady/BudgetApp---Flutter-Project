import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class ProfileChangeEmailData {
  Crud crud;
  ProfileChangeEmailData(this.crud);
  postData(String email, String userid) async {
    var response = await crud.postData(
        AppApiLinks.linkchangeemail, {"Email": email, "User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
