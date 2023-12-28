import 'package:flutter/material.dart';
import 'package:flutter_gpastudent/components/bottom_nav.dart';
import 'package:flutter_gpastudent/views/detail_term/detail_term.dart';
import 'package:flutter_gpastudent/views/home/homepage.dart';
import 'package:flutter_gpastudent/views/profile/profile_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _title = "GPA Homepage";

  int _currentIndex = 0;

  final List<Widget> _children = [Homepage(), ProfileScreen()];

  void onTappeb(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'Home';
          break;
        case 1:
          _title = 'Profile';
          break;
        default:
          _title = "GPA Homepage";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigation(
        onTap: (value) {
          onTappeb(value);
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
