import 'package:flutter/material.dart';
import 'package:flutter_body_calculator_app/views/splash_screeen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

//----------------
void main() {
  runApp(
    //----------------คลาสที่ใช้เรียกwidgetหลักของแอป
FlutterBodyCalculatorApp(),
  );
}

//----------------
class FlutterBodyCalculatorApp extends StatefulWidget {
  const FlutterBodyCalculatorApp({super.key});

  @override
  State<FlutterBodyCalculatorApp> createState() => _FlutterBodyCalculatorAppState();
}

class _FlutterBodyCalculatorAppState extends State<FlutterBodyCalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreeenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}