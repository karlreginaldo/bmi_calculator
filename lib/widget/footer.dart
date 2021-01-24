import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmicalcu/bmi_services.dart';
import 'bottomsheet.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('YOU WANT TO SEE YOUR HISTORY?'),
        FlatButton(
          child: Text(
            'REVIEW',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xff009DF5),
            ),
          ),
          onPressed: () async {
            await Get.find<BMIServices>().readData();
            showBottomSheet();
          },
        )
      ],
    );
  }
}

showBottomSheet() {
  return Get.bottomSheet(
    BottomSheetView(),
  );
}
