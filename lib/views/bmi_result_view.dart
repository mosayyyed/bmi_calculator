import 'package:flutter/material.dart';

import '../utility/bmi_utilities.dart';
import '../widgets/home/calculate_button_widget.dart';
import '../widgets/result/result_card_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args == null) {
      return errorScreen();
    }

    final bmi = calculateBMI(args['weight'], args['height']);
    final bmiResult = getBMIResultCategory(bmi);
    final textColor = getResultTextColor(bmiResult);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ResultCard(
              bmi: bmi,
              bmiResult: bmiResult,
              textColor: textColor,
              userData: args,
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
}
