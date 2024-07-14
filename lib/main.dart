import 'package:flutter/material.dart';

import 'views/bmi_calculator_view.dart';
import 'views/bmi_result_view.dart';

void main() => runApp(const BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const CalculatorScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}
