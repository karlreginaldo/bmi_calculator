import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bmi_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.blueAccent,
        hintColor: Colors.white,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          bodyText2: GoogleFonts.deliusUnicase(),
          button: GoogleFonts.deliusUnicase(),
          caption: GoogleFonts.deliusUnicase(),
        ),
      ),
      home: Scaffold(
        body: BMICalculator(),
      ),
    );
  }
}
