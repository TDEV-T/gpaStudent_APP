import 'package:flutter_gpastudent/views/login/login_page.dart';

class AppRouter {
  static const String login = 'login';

  static get routes => {
        login: (context) => LoginPage(),
      };
}
