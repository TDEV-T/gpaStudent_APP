import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gpastudent/components/rounded_button.dart';
import 'package:flutter_gpastudent/main.dart';
import 'package:flutter_gpastudent/services/rest_api.dart';
import 'package:flutter_gpastudent/utils/app_router.dart';
import 'package:flutter_gpastudent/utils/utility.dart';
import 'package:flutter_gpastudent/views/login/components/TextInputField.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKeyLogin = GlobalKey<FormState>();

  final _studentId = TextEditingController();

  final _nationalId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "เข้าสู่ระบบ",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKeyLogin,
            child: Column(
              children: [
                TextinputField(
                  controller: _studentId,
                  hintText: "รหัสประจำตัวนักศึกษา",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกรหัสประจำตัวนักศึกษา";
                    } else if (value.length < 11) {
                      return "กรุณากรอกรหัสนักศึกษาให้ถูกต้อง";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  prefixIcon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextinputField(
                  controller: _nationalId,
                  hintText: "รหัสบัตรประชาชน",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกรหัสประจำตัวประชาชน";
                    } else if (value.length < 13) {
                      return "กรุณากรอกรหัสประจำตัวประชาชนให้ถูกต้อง";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  prefixIcon: const Icon(Icons.perm_identity_sharp),
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundedButton(
                    label: "Login",
                    onPressed: () async {
                      if (_formKeyLogin.currentState!.validate()) {
                        _formKeyLogin.currentState!.save();

                        var resp = await RESTAPI().loginStudent({
                          "studentId": _studentId.text,
                          "nationalId": _nationalId.text,
                        });

                        var body = jsonDecode(resp);

                        Utility().logger.i(body);

                        if (body != null) {
                          if (body['message'] == 'Not Connection Network') {
                            Utility.showAlertDialog(context, "แจ้งเตือน",
                                "ไม่มีการเชื่อมต่อ Internet");
                          } else if (body['message'] ==
                                  "Can't find StudentID" &&
                              body['studentId'] == null) {
                            Utility.showAlertDialog(context, "แจ้งเตือน",
                                "รหัสนักเรียนหรือรหัสบัตรประชาชนผิด ");
                          } else if (body['message'] == 'Login Success') {
                            await Utility.initSharedPrefs();
                            Utility.setSharedPreference(
                                "studentID", body['studentId']);
                            Navigator.pushReplacementNamed(context, AppRouter.homepage);
                          }
                        } else {
                          if (body['status'] == 'ok') {
                            Utility.showAlertDialog(
                                context, "แจ้งเตือน", "Error Can't find");
                          }
                        }
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
