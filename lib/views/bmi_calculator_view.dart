import 'package:flutter/material.dart';

import '../enum/gender_enum.dart';
import '../widgets/home/calculate_button_widget.dart';
import '../widgets/home/gender_selection_row_widget.dart';
import '../widgets/home/height_card_widget/height_card_widget.dart';
import '../widgets/home/weight_and_age_row/value_row_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  Gender selectedGender = Gender.male;
  double height = 175;
  int weight = 65;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  GenderSelectionRow(
                    selectedGender: selectedGender,
                    onGenderSelected: (Gender gender) {
                      setState(() {
                        selectedGender = gender;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  HeightSelectorCard(
                    height: height,
                    onHeightChanged: (double newHeight) {
                      setState(() {
                        height = newHeight;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ValueRow(
                    value1: weight,
                    value2: age,
                    onValue1Changed: (int newWeight) {
                      setState(() {
                        weight = newWeight;
                      });
                    },
                    onValue2Changed: (int newAge) {
                      setState(() {
                        age = newAge;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          CalculateButton(
            text: "CALCULATE",
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/result",
                arguments: {
                  'gender': selectedGender,
                  'height': height,
                  'weight': weight,
                  'age': age,
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
