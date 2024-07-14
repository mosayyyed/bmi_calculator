import 'package:flutter/material.dart';

import '../enum/gender_enum.dart';

class GenderSelectionRow extends StatelessWidget {
  final Gender selectedGender;
  final ValueChanged<Gender> onGenderSelected;

  const GenderSelectionRow({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: _GenderCard(
              gender: Gender.male,
              isSelected: selectedGender == Gender.male,
              onTap: () => onGenderSelected(Gender.male),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _GenderCard(
              gender: Gender.female,
              isSelected: selectedGender == Gender.female,
              onTap: () => onGenderSelected(Gender.female),
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderCard extends StatelessWidget {
  final Gender gender;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderCard({
    required this.gender,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff323244) : const Color(0xff1d1e33),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gender == Gender.male ? Icons.male : Icons.female,
              size: 80,
              color: Colors.white,
            ),
            Text(
              gender.name.toUpperCase(),
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              height: 2.0,
              width: 60.0,
              color: isSelected ? Colors.pink : const Color(0xff1d1e33),
            ),
          ],
        ),
      ),
    );
  }
}
