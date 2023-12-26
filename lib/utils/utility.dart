import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import "package:logger/logger.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Utility {
  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static Future<String> checkNetwork() async {
    var CheckNet = await Connectivity().checkConnectivity();

    if (CheckNet == ConnectivityResult.none) {
      return '';
    } else if (CheckNet == ConnectivityResult.mobile) {
      return 'mobile';
    } else if (CheckNet == ConnectivityResult.wifi) {
      return 'wifi';
    }

    return '';
  }

  static SharedPreferences? _preferences;
  static Future initSharedPrefs() async =>
      _preferences = await SharedPreferences.getInstance();

  static dynamic getSharedPreference(String key) {
    if (_preferences == null) return null;

    return _preferences!.get(key);
  }

  static Future<bool> setSharedPreference(String key, dynamic value) async {
    if (_preferences == null) return false;
    if (value is String) return await _preferences!.setString(key, value);
    if (value is int) return await _preferences!.setInt(key, value);
    if (value is bool) return await _preferences!.setBool(key, value);
    if (value is double) return await _preferences!.setDouble(key, value);

    return false;
  }

  static Future<bool> removeSharedPreference(String key) async {
    if (_preferences == null) return false;
    return await _preferences!.remove(key);
  }

  static Future<bool> clearSharedPreference() async {
    if (_preferences == null) return false;
    return await _preferences!.clear();
  }

  static Future<bool> checkSharedPreference(String key) async {
    if (_preferences == null) return false;
    return _preferences!.containsKey(key);
  }

  static showAlertDialog(context, title, content) {
    AlertDialog buildAlertDialog(Color backgroundColor, IconData icon) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: backgroundColor,
              radius: 35,
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ),
            Text(content),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ตกลง'),
            ),
          ),
        ],
      );
    }

    switch (title) {
      case "ok":
        return showDialog(
          context: context,
          builder: (BuildContext context) => FractionallySizedBox(
              heightFactor: 0.4,
              child: buildAlertDialog(Colors.green[700]!, Icons.check)),
        );
      case "error":
        return showDialog(
          context: context,
          builder: (BuildContext context) => FractionallySizedBox(
              heightFactor: 0.4,
              child: buildAlertDialog(Colors.red[700]!, Icons.close)),
        );
      default:
        return showDialog(
          context: context,
          builder: (BuildContext context) => FractionallySizedBox(
              heightFactor: 0.4,
              child: buildAlertDialog(Colors.blue[700]!, Icons.info_outline)),
        );
    }
  }
}
