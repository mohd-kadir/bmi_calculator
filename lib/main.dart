import 'package:bmi_calculator/BMICalculatorScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      theme: ThemeData(fontFamily: 'Roboto'),
      home: BMICalculatorScreen(),
    );
  }
}
