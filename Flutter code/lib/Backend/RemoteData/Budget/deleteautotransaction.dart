import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';
import 'package:mainflutterproject/linkapi.dart';

class DeleteAutoTransactionData {
  Crud crud;
  DeleteAutoTransactionData(this.crud);
  postData(String autoTransID) async {
    var response = await crud.postData(AppApiLinks.linkdeleteautotransaction, {
      "Auto_TransID": autoTransID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
