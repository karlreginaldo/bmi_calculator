import 'package:flutter/widgets.dart';

class BMIModel {
  var height = TextEditingController();
  var weight = TextEditingController();

  int heightGet;
  int weightGet;
  String date;
  double result;
  String category;
  BMIModel(
      {this.heightGet, this.weightGet, this.date, this.result, this.category});
}
