import 'bmi_model.dart';
import 'package:get/get.dart';
import 'bmi_helper.dart';

class BMIServices extends GetxController {
  List history = [];
  BMIHelper helper = BMIHelper();
  double result = 0.00001;
  String category = 'NORMAL';
  bool isHeightNull = false;
  bool isWeightNull = false;

  //Solving the give data to convert into BMI(result)
  double compute(BMIModel model) {
    //TODO:I will improve logic here (i feel something wrong with this function)

    print('Computing...');
    //Converting String to integer
    int height = int.parse(model.height.text);
    int weight = int.parse(model.weight.text);
    result = (weight / ((height * height) * 0.0001));
    compare(); //This callback I think
    return result;
  }

  //Comparing the result in the categories
  compare() {
    /*BMI Categories:
      Underweight = <18.5
      Normal weight = 18.5–24.9
      Overweight = 25–29.9
      Obesity = BMI of 30 or greater 
      Orig Formula: weight / height squared
    */
    print('Comparing...');

    if (result < 18.5) {
      category = 'UNDER';
      createData();
      return category;
    } else if (result >= 18.5 && result <= 24.9) {
      category = 'NORMAL';
      createData();
      return category;
    } else if (result >= 25 && result <= 29.9) {
      category = 'OVER';
      createData();
      return category;
    } else if (result >= 30) {
      category = 'OBESITY';
      createData();
      return category;
    }
    createData();
  }

  //DateTime: Get the String Date(I think the return should be placed in variable "String date;")
  String getDateCreated() {
    DateTime dateCreatedUnformat = DateTime.now();

    return '${dateCreatedUnformat.month}/${dateCreatedUnformat.day}/${dateCreatedUnformat.year}';
  }

  //Database: Inserting Data into sqlite
  createData() async {
    var db = await this.helper.database;
    print('Creating Data');

    return await db.rawInsert('''
    insert into $tableBMI($columnResult,$columnCategory,$columnDate) values ('${this.result}','${this.category}','${this.getDateCreated()}')
    ''');
  }

  //Database: Extract Data into history
  readData() async {
    var db = await this.helper.database;
    print(await db.query(tableBMI));
    return history = await db.query(tableBMI);
  }
}
