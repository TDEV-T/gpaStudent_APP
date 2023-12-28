import 'package:flutter/material.dart';
import 'package:flutter_gpastudent/controllers/user_controller.dart';
import 'package:flutter_gpastudent/utils/app_router.dart';
import 'package:flutter_gpastudent/utils/utility.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  // final Map<String, dynamic> userData;

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Utility.initSharedPrefs();

      String? studentId = Utility.getSharedPreference("studentID");

      if (studentId == null) {
        Navigator.pushReplacementNamed(context, AppRouter.login);
      } else {
        userController.setResulttoUser(studentId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() {
              var userData = userController.User;
              // print(userData);
              if (userData.isEmpty) {
                return const CircularProgressIndicator();
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student ID: ${userData["studentId"]}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'First Name: ${userData["fname"]}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Last Name: ${userData["lname"]}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'National ID: ${userData["nationalId"]}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Utility.removeSharedPreference("studentId");

                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRouter.login, (route) => false);
                    },
                    child: const Text('Logout'),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
