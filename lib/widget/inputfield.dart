import 'package:flutter/material.dart';

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
