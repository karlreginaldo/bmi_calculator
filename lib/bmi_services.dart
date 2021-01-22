import 'bmi_model.dart';
import 'package:get/get.dart';

class BMIServices extends GetxController {
  double result = 0.00001;
  String category = 'NORMAL';
  bool isHeightNull = false;
  bool isWeightNull = false;
  compute(BMIModel model) {
    int height = int.parse(model.height.text);
    int weight = int.parse(model.weight.text);
    return result = (weight / ((height * height) * 0.0001));
  }

  compare() {
    if (result < 18.5) {
      return category = 'UNDER';
    } else if (result >= 18.5 && result <= 24.9) {
      return category = 'NORMAL';
    } else if (result >= 25 && result <= 29.9) {
      return category = 'OVER';
    } else if (result >= 30) {
      return category = 'OBESITY';
    }
  }
}

/* BMI Categories:
Underweight = <18.5
Normal weight = 18.5–24.9
Overweight = 25–29.9
Obesity = BMI of 30 or greater */
