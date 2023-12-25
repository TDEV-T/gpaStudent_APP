import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Utility {
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

  static showAlertDialog(context, title, content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("ตกลง"),
              ),
            ],
          );
        });
  }
}
