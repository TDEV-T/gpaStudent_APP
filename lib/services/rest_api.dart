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

  getStudentById(data) async {
    if (await Utility.checkNetwork() == '') {
      return jsonEncode({'message': 'Not Connection Network'});
    } else {
      try {
        final response = await _dio.get('students/${data}');
        print(response.data);
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
        Map<String, dynamic> resultData = {};

        int totalCreditHourse = 0;
        double totalGpa = 0;

        for (int i = 0; i < resp.data.length; i++) {
          var termCode = resp.data[i]["termCode"];
          var gradeData = resp.data[i]["grade"];

          if (!resultData.containsKey(termCode)) {
            resultData[termCode] = {
              "termCode": resp.data[i]["termCode"],
              "termName": resp.data[i]["termName"],
              "startDate": resp.data[i]["startDate"],
              "endDate": resp.data[i]["endDate"],
              "totalCreditHourse": 0,
              "gradeList": {},
              "gpa": 0,
            };
          }

          int creditHourse = gradeData["creditHourse"];
          double score = gradeData["score"];
          double grade = 0;

          if (score >= 80) {
            grade = 4;
          } else if (score >= 75) {
            grade = 3.5;
          } else if (score >= 70) {
            grade = 3;
          } else if (score >= 65) {
            grade = 2.5;
          } else if (score >= 60) {
            grade = 2;
          } else if (score >= 55) {
            grade = 1.5;
          } else if (score >= 50) {
            grade = 1;
          } else {
            grade = 0;
          }

          resultData[termCode]["totalCreditHourse"] += creditHourse;
          double gpaCal = grade * creditHourse;
          resultData[termCode]["gpa"] += gpaCal;
          resultData[termCode]["totalGPA"] = resultData[termCode]["gpa"] /
              resultData[termCode]["totalCreditHourse"];

          resultData[termCode]["gradeList"]
              [resultData[termCode]["gradeList"].length + 1] = {
            "id": gradeData["id"],
            "subject": gradeData["subject"],
            "score": gradeData["score"],
            "grade": grade,
            "creditHourse": creditHourse,
          };

          totalGpa += gpaCal;
          totalCreditHourse += creditHourse;
        }
        resultData["totalGPA"] = totalGpa / totalCreditHourse;
        resultData["creditHourse"] = totalCreditHourse;
        Utility().logger.e(resultData);
        return resultData;
      } else {
        return jsonEncode({'message': "No data"});
      }
    }
  }
}
