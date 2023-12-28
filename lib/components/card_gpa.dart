import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gpastudent/utils/app_router.dart';
import 'package:flutter_gpastudent/utils/utility.dart';

class CardGPA extends StatelessWidget {
  const CardGPA({Key? key, required this.gradeData}) : super(key: key);

  final dynamic? gradeData;

  @override
  Widget build(BuildContext context) {
    if (gradeData == null) {
      return const SizedBox.shrink();
    }

    if (gradeData is Map<dynamic, dynamic>) {
      final Map<dynamic, dynamic> gradeList = gradeData!['gradeList'] ?? {};
      return Card(
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRouter.detailpage,
                arguments: gradeData);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'เทอม : ${gradeData!["termName"]}',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'เริ่มต้น: ${gradeData!["startDate"]}',
                  style: const TextStyle(fontSize: 16.0),
                ),
                Text(
                  'สิ้นสุด : ${gradeData!["endDate"]}',
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'หน่วยกิตทั้งหมด: ${gradeData!["totalCreditHourse"]}',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text('เกรดเฉลี่ยรวม : ${gradeData["totalGPA"]}'),
              ],
            ),
          ),
        ),
      );
    } else if (gradeData is double) {
      return Card(
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GPA: ${gradeData.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
