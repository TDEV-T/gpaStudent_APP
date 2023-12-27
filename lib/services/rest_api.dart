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
        Utility().logger.e(e);
      }
    }
  }

  getGradeByStuId(data) async {
    if (await Utility.checkNetwork() == '') {
      return jsonEncode({'message': 'Not Connection Network'});
    } else {
      final resp = await _dio.get('grades/student/' + data);

      if (resp.data.isNotEmpty) {
        Map<String, dynamic> resultData = {
        };

        for (int i = 0; i < resp.data.length; i++) {
          var termCode = resp.data[i]["termCode"];
          var gradeData = resp.data[i]["grade"];

          if (!resultData.containsKey(termCode)) {
            resultData[termCode] = {
              "termCode": resp.data[i]["termCode"],
              "termName": resp.data[i]["termName"],
              "startDate": resp.data[i]["startDate"],
              "endDate": resp.data[i]["endDate"],
              "gradeList": {},
            };
          }

          resultData[termCode]["gradeList"][i + 1] = {
            "id": gradeData["id"],
            "subject": gradeData["subject"],
            "score": gradeData["score"],
            "creditHourse": gradeData["creditHourse"],
          };
        }

        Utility().logger.e(resultData);

        return resultData;
      } else {
        return jsonEncode({'message': "No data"});
      }
    }
  }
}
