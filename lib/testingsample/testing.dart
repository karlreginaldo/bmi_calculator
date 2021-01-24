import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello World'),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Hint',
              labelText: 'Label',
            ),
          ),
          RaisedButton(
            child: Text('Click'),
            onPressed: () async {},
          ),
        ],
      ),
    );
  }
}
