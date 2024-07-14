import 'package:flutter/material.dart';

Scaffold errorScreen() =>
    const Scaffold(body: Center(child: Text('No BMI data available.')));

double calculateBMI(int weight, double height) =>
    weight / ((height / 100) * (height / 100));

String getBMIResultCategory(double bmi) => bmi < 18.5
    ? "UNDERWEIGHT"
    : bmi < 25
        ? "NORMAL"
        : bmi < 30
            ? "OVERWEIGHT"
            : "OBESE";

Color getResultTextColor(String bmiResult) =>
    bmiResult == "NORMAL" ? Colors.green : Colors.red;

String getResultDescription(String bmiResult) {
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
