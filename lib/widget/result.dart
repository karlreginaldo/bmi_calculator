import 'package:bmicalcu/bmi_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xff828282),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'B M I',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            Get.find<BMIServices>().result.toString().substring(0, 5),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: Color(0xff009DF5),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.white,
            indent: 50,
            endIndent: 50,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'C A T E G O R Y',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            Get.find<BMIServices>().category,
            style: TextStyle(
              fontSize: 40,
              color: Color(0xff009DF5),
            ),
          ),
          (Get.find<BMIServices>().category != 'OBESITY')
              ? Text(
                  'WEIGHT',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff009DF5),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
