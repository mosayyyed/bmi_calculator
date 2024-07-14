import 'package:flutter/material.dart';

import '../../enum/gender_enum.dart';
import 'gender_card_widget.dart';

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
            child: GenderCard(
              gender: Gender.male,
              isSelected: selectedGender == Gender.male,
              onTap: () => onGenderSelected(Gender.male),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GenderCard(
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
