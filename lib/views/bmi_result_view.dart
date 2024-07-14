import 'package:flutter/material.dart';

import '../enum/gender_enum.dart';
import '../widgets/calculate_button_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args == null) return _errorScreen();

    final bmi = _calculateBMI(args['weight'], args['height']);
    final bmiResult = _getBMIResult(bmi);
    final textColor = _getResultTextColor(bmiResult);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Your Result',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: const Color(0xff323244),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(bmiResult,
                      style: TextStyle(
                          fontSize: 22,
                          color: textColor,
                          fontWeight: FontWeight.bold)),
                  Text(bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 100, fontWeight: FontWeight.bold)),
                  Text(_getResultDescription(bmiResult),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18)),
/*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Gender: ${_genderToString(args['gender'])}',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white70)),
                      Text('Age: ${args['age']}',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white70)),
                    ],
                  )
*/
                ],
              ),
            ),
          ),
          CalculateButton(
            text: "RE-CALCULATE",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Scaffold _errorScreen() =>
      const Scaffold(body: Center(child: Text('No BMI data available.')));

  double _calculateBMI(int weight, double height) =>
      weight / ((height / 100) * (height / 100));

  String _getBMIResult(double bmi) => bmi < 18.5
      ? "UNDERWEIGHT"
      : bmi < 25
          ? "NORMAL"
          : bmi < 30
              ? "OVERWEIGHT"
              : "OBESE";

  Color _getResultTextColor(String bmiResult) =>
      bmiResult == "NORMAL" ? Colors.green : Colors.red;

  String _getResultDescription(String bmiResult) {
    switch (bmiResult) {
      case "UNDERWEIGHT":
        return "You are underweight. Consider consulting a nutritionist.";
      case "NORMAL":
        return "You have a normal body weight. Good job!";
      case "OVERWEIGHT":
        return "You are overweight. Consider a healthier lifestyle.";
      case "OBESE":
        return "You are obese. It's important to consult a doctor.";
      default:
        return "";
    }
  }

  String _genderToString(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      default:
        return '';
    }
  }
}
