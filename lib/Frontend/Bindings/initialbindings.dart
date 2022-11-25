import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
