import 'dart:convert';

import 'package:flutter_gpastudent/services/rest_api.dart';
import 'package:flutter_gpastudent/utils/utility.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var User = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setResulttoUser(studentId) async {
    var resp = await RESTAPI().getStudentById(studentId);
    var respDecode = jsonDecode(resp);
    Utility().logger.e(respDecode);
    User.assignAll(respDecode);
  }
}
