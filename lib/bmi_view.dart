import 'package:bmicalcu/widget/footer.dart';
import 'package:bmicalcu/widget/inputfield.dart';
import 'package:bmicalcu/widget/result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi_services.dart';
import 'bmi_model.dart';
import 'widget/button.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  var model = BMIModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BMIServices>(
        init: BMIServices(),
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  ResultContainer(),
                  SizedBox(
                    height: 50,
                  ),
                  InputBox(
                    label: 'HEIGHT',
                    hint: 'CM(CENTIMETERS)',
                    controller: model.height,
                    isNull: Get.find<BMIServices>().isHeightNull,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InputBox(
                    label: 'WEIGHT',
                    hint: 'KG(KILOGRAMS)',
                    controller: model.weight,
                    isNull: Get.find<BMIServices>().isWeightNull,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ButtonBox(
                    onPressed: () {
                      setState(() {
                        handler(
                          model: model,
                        );
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Footer(),
                ],
              ),
            ),
          );
        });
  }
}

//Result Body

//Text Field

showValidation() {
  return Get.snackbar(
    'You Get ${Get.find<BMIServices>().result.toString().substring(0, 5)}',
    'You have succesfully add new BMI',
    colorText: Colors.black,
  );
}

handler({BMIModel model}) {
  if (model.height.text.isEmpty && model.weight.text.isEmpty) {
    print('Empty Both');
    Get.find<BMIServices>().isWeightNull = true;
    Get.find<BMIServices>().isHeightNull = true;
  } else if (model.height.text.isNotEmpty && model.weight.text.isNotEmpty) {
    print('Not Empty Both');
    Get.find<BMIServices>().isHeightNull = false;
    Get.find<BMIServices>().isWeightNull = false;
    Get.find<BMIServices>().compute(model);
    Get.find<BMIServices>().compare();
    showValidation();
  } else if (model.height.text.isEmpty) {
    print('Empty Height');
    Get.find<BMIServices>().isHeightNull = true;
  } else if (model.weight.text.isEmpty) {
    print('Empty Weight');
    Get.find<BMIServices>().isWeightNull = true;
  } else if (model.height.text.isNotEmpty) {
    print('Not Empty Height');
    Get.find<BMIServices>().isHeightNull = false;
  } else if (model.weight.text.isNotEmpty) {
    print('Not Empty Weight');
    Get.find<BMIServices>().isWeightNull = false;
  }
}
