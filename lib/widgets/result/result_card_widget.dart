import 'package:flutter/material.dart';

import '../../enum/gender_enum.dart';
import '../../utility/bmi_utilities.dart';

class ResultCard extends StatelessWidget {
  final double bmi;
  final String bmiResult;
  final Color textColor;
  final Map<String, dynamic> userData;

  const ResultCard({
    super.key,
    required this.bmi,
    required this.bmiResult,
    required this.textColor,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color(0xff323244),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            bmiResult,
            style: TextStyle(
              fontSize: 22,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            bmi.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              getResultDescription(bmiResult),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
/*
          _buildUserDataDisplay(userData),
*/
        ],
      ),
    );
  }

  Widget _buildUserDataDisplay(Map<String, dynamic> userData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Gender: ${genderToString(userData['gender'])}',
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
        Text(
          'Age: ${userData['age']}',
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ],
    );
  }
}
