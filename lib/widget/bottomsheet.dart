import 'package:bmicalcu/bmi_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Get.find<BMIServices>().history.isEmpty)
        ? Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff828282), Colors.black],
              ),
            ),
            child: Center(
                child: CircularProgressIndicator(
              strokeWidth: 5,
            )),
          )
        : Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff828282), Colors.black],
              ),
            ),
            child: showHistoryList(),
          );
  }
}

//TODO: implement model method with array
Expanded showHistoryList() {
//TODO: Use Moor Database
  return Expanded(
    child: ListView.builder(
        itemCount: Get.find<BMIServices>().history.length,
        reverse: true,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    'WEIGHT:${Get.find<BMIServices>().history[index].category}',
                    style: GoogleFonts.deliusUnicase(),
                  ),
                ],
              ),
              subtitle: Text(
                '${Get.find<BMIServices>().history[index].result}',
                style: GoogleFonts.deliusUnicase(color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              trailing: Text(
                Get.find<BMIServices>().history[index].date,
              ),
              isThreeLine: true,
            ),
          );
        }),
  );
}
