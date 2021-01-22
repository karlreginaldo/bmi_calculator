import 'package:flutter/material.dart';

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
