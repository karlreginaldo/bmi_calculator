import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi_services.dart';
import 'bmi_model.dart';

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
                        print(Get.find<BMIServices>().isHeightNull);
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

//Result Body asdasd
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

//Text Fieldsdadasdassd
class InputBox extends StatelessWidget {
  final String label;
  final String hint;
  final bool isNull;

  final TextEditingController controller;
  InputBox({
    this.label,
    this.hint,
    this.controller,
    this.isNull,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        filled: true,
        hintText: hint ?? 'Hint',
        labelText: label ?? 'Label',
        errorText: (isNull) ? 'Please Enter Value' : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class ButtonBox extends StatelessWidget {
  final Function onPressed;
  ButtonBox({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
      child: const Text('CALCULATE'),
      onPressed: onPressed,
    );
  }
}

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
          onPressed: showBottomSheet,
        )
      ],
    );
  }
}

showBottomSheet() {
  return Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xff828282), Colors.white],
        ),
      ),
      child: showHistoryList(),
    ),
  );
}

showHistoryList() {
//TODO: Decide if you use either firestore or localdatabase
  return Expanded(
    child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Theme(
            data: ThemeData(
              primaryColor: Colors.black,
              accentColor: Colors.black,
            ),
            child: ListTile(
              title: Text('Title'),
              contentPadding: EdgeInsets.all(20),
              subtitle: Text('Subtitle'),
              trailing: Icon(
                Icons.check,
                color: Colors.green,
              ),
              //TODO: it should beDate Created
              isThreeLine: true,
            ),
          );
        }),
  );
}

handler({BMIModel model}) {
  if (model.height.text.isEmpty && model.weight.text.isEmpty) {
    print('Empty Bo');
    Get.find<BMIServices>().isWeightNull = true;
    Get.find<BMIServices>().isHeightNull = true;
  } else if (model.height.text.isNotEmpty && model.weight.text.isNotEmpty) {
    print('Not Empty Both');
    Get.find<BMIServices>().isHeightNull = false;
    Get.find<BMIServices>().isWeightNull = false;
    Get.find<BMIServices>().compute(model);
    Get.find<BMIServices>().compare();
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
