import 'package:get/get.dart';

inputValidator(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "emptyCheck".tr;
  }
  if (val.length < min) {
    return "${"minCheck".tr}$min";
  }
  if (val.length > max) {
    return "${"maxCheck".tr}$max";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "usernameCheck".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "emailCheck".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "phoneCheck".tr;
    }
  }
}
