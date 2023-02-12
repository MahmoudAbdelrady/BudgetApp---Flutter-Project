import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postData(String email) async {
    var response = await crud
        .postData(AppApiLinks.linkforgetpasscheckemail, {"Email": email});

    return response.fold((l) => l, (r) => r);
  }
}
