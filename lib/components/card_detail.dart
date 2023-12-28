import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({Key? key, required this.detailData}) : super(key: key);

  final Map<String, dynamic>? detailData;

  @override
  Widget build(BuildContext context) {
    if (detailData == null) {
      return const SizedBox.shrink();
    }

    final Map<dynamic, dynamic>? gradeList = detailData!['gradeList'];

    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'เทอม : ${detailData!["termName"]}',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Text(
              'เริ่มต้น: ${detailData!["startDate"]}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'สิ้นสุด : ${detailData!["endDate"]}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 25.0),
            Text(
              'หน่วยกิตทั้งหมด: ${detailData!["totalCreditHourse"]}',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Text(
              'เกรดเฉลี่ยรวม : ${detailData!["totalGPA"]}',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const SizedBox(height: 25.0),
            if (gradeList != null && gradeList.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'รายวิชา:',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  for (final entry in gradeList.entries)
                    Text(
                      '${entry.key}. ${entry.value["subject"]["subjectName"]} - Score: ${entry.value["score"]} - Credit Hours: ${entry.value["creditHourse"]}',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
