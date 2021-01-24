import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmicalcu/testingsample/testing.dart';

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
          bodyText1: GoogleFonts.deliusUnicase(),
          caption: GoogleFonts.deliusUnicase(),
          headline1: GoogleFonts.deliusUnicase(),
          headline2: GoogleFonts.deliusUnicase(),
          headline3: GoogleFonts.deliusUnicase(),
          headline4: GoogleFonts.deliusUnicase(),
          headline5: GoogleFonts.deliusUnicase(),
          headline6: GoogleFonts.deliusUnicase(),
          subtitle2: GoogleFonts.deliusUnicase(),
        ),
      ),
      home: Scaffold(
        body: Testing(),
      ),
    );
  }
}
