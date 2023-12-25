import 'package:flutter/material.dart';
import 'package:flutter_gpastudent/components/mobile_layout.dart';
import 'package:flutter_gpastudent/components/responsive_layout.dart';
import 'package:flutter_gpastudent/components/web_layout.dart';
import 'package:flutter_gpastudent/views/login/login_form.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset("assets/images/logo_color.png", width: 200),
          dataWidget: LoginForm(),
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset("assets/images/logo_color.png", width: 75),
          dataWidget: LoginForm(),
        ));
  }
}
