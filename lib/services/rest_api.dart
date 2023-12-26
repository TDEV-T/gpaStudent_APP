import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_gpastudent/services/dio_config.dart';
import 'package:flutter_gpastudent/utils/utility.dart';
import 'package:logger/logger.dart';

class RESTAPI {
  final Dio _dio = DioConfig.dio;

  loginStudent(data) async {
    if (await Utility.checkNetwork() == '') {
      return jsonEncode({'message': 'Not Connection Network'});
    } else {
      try {
        final response =
            await _dio.post('students/login', data: jsonEncode(data));
        return jsonEncode(response.data);
      } catch (e) {
        Logger().e(e);
      }
    }
  }
}
