import 'package:flutter/widgets.dart';

class BMIModel {
  var height = TextEditingController();
  var weight = TextEditingController();

  int heightGet;
  int weightGet;
  String date;
  double result;
  String category;

  //Constructor:Im thinking to remove this. but for now all is working. I dont want to get some bugs maybe later Ill remove this constructor hehehe
  BMIModel(
      {this.heightGet, this.weightGet, this.date, this.result, this.category});

  //Soon I will update this into services to create data but for now i think manual sql code is better
  /* getMap() {
    Map map = {
      'result': this.result,
      'category': this.category,
      'date': this.date
    };
    return map;
  } */
}
