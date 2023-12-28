import 'package:flutter/material.dart';
import 'package:flutter_gpastudent/components/card_gpa.dart';
import 'package:flutter_gpastudent/controllers/gpa_controller.dart';
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
  final gpacontroller = Get.put(GpaController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Utility.initSharedPrefs();

      String? studentId = Utility.getSharedPreference("studentID");

      if (studentId == null) {
        Navigator.pushReplacementNamed(context, AppRouter.login);
      } else {
        gpacontroller.setResulttoGPA(studentId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Container(
        child: Center(
          child: GetX<GpaController>(
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.gpa.length,
                itemBuilder: (BuildContext context, int index) {
                  var termEntry = gpacontroller.gpa.entries.elementAt(index);
                  var termCode = termEntry.key;

                  return CardGPA(gradeData: controller.gpa[termCode]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
