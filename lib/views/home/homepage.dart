import 'package:flutter/material.dart';
import 'package:flutter_gpastudent/services/rest_api.dart';
import 'package:flutter_gpastudent/utils/app_router.dart';
import 'package:flutter_gpastudent/utils/utility.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      await Utility.initSharedPrefs();

      String? studentId = Utility.getSharedPreference("studentID");

      if (studentId == null) {
        Navigator.pushReplacementNamed(context, AppRouter.login);
      }else{
        var resp = await RESTAPI().getGradeByStuId(studentId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("test"),
      ),
    );
  }
}
