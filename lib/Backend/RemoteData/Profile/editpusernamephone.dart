import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class EditPUsernamePhoneData {
  Crud crud;
  EditPUsernamePhoneData(this.crud);
  postData(String username, String phone, String userid) async {
    var response = await crud.postData(AppApiLinks.linkeditusernamephone,
        {"Username": username, "Phone": phone, "User_ID": userid});
    return response.fold((l) => l, (r) => r);
  }
}
