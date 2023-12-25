import 'package:flutter_gpastudent/views/home/homepage.dart';
import 'package:flutter_gpastudent/views/login/login_page.dart';

class AppRouter {
  static const String login = 'login';
  static const String homepage = 'homepage';

  static get routes => {
        login: (context) => LoginPage(),
        homepage: (context) => Homepage(),
      };
}
