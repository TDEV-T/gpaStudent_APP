import 'package:flutter/material.dart';
import 'package:flutter_gpastudent/services/rest_api.dart';
import 'package:flutter_gpastudent/utils/utility.dart';
import 'package:get/get.dart';

class GpaController extends GetxController {
  var gpa = {}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setResulttoGPA(studentId) async {
    var resp = await RESTAPI().getGradeByStuId(studentId);
    gpa.assignAll(resp);
  }
}
