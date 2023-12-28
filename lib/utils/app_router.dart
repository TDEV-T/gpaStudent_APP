import 'package:flutter_gpastudent/views/dashboard/dashboard_screen.dart';
import 'package:flutter_gpastudent/views/detail_term/detail_term.dart';
import 'package:flutter_gpastudent/views/home/homepage.dart';
import 'package:flutter_gpastudent/views/login/login_page.dart';

class AppRouter {
  static const String login = 'login';
  static const String homepage = 'homepage';
  static const String detailpage = 'detailpage';

  static get routes => {
        login: (context) => LoginPage(),
        homepage: (context) => DashboardScreen(),
        detailpage: (context) => DetailTerm()
      };
}
