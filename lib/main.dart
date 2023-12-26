import "package:flutter/material.dart";
import "package:flutter_gpastudent/themes/styles.dart";
import "package:flutter_gpastudent/utils/app_router.dart";
import "package:flutter_gpastudent/utils/utility.dart";
import "package:shared_preferences/shared_preferences.dart";

var initialRoute;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Utility.initSharedPrefs();

  

  String? studentId = Utility.getSharedPreference('studentID');

  if (studentId != null) {
    initialRoute = AppRouter.homepage;
  } else {
    initialRoute = AppRouter.login;
  }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test GetX',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRouter.login,
      routes: AppRouter.routes,
    );
  }
}
