import "package:flutter/material.dart";
import "package:flutter_gpastudent/themes/styles.dart";
import "package:flutter_gpastudent/utils/app_router.dart";

void main() {
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
