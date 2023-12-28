import 'package:flutter/material.dart';
import 'package:flutter_gpastudent/components/card_detail.dart';
import 'package:flutter_gpastudent/utils/utility.dart';

class DetailTerm extends StatelessWidget {
  const DetailTerm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic? gradeData = ModalRoute.of(context)?.settings.arguments;
    Utility().logger.e(gradeData);
    return Scaffold(
      appBar: AppBar(title: const Text("รายละเอียด")),
      body: Center(
        child: CardDetail(detailData: gradeData),
      ),
    );
  }
}
