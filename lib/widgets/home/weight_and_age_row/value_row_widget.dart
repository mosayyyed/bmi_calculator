import 'package:flutter/material.dart';

import 'value_card_widget.dart';

class ValueRow extends StatelessWidget {
  final int value1;
  final int value2;
  final ValueChanged<int> onValue1Changed;
  final ValueChanged<int> onValue2Changed;

  static const int maxValue1 = 150;
  static const int maxValue2 = 100;

  const ValueRow({
    super.key,
    required this.value1,
    required this.value2,
    required this.onValue1Changed,
    required this.onValue2Changed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ValueCard(
              label: 'WEIGHT',
              value: value1,
              onDecrease: value1 > 1 ? () => onValue1Changed(value1 - 1) : null,
              onIncrease:
                  value1 < maxValue1 ? () => onValue1Changed(value1 + 1) : null,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ValueCard(
              label: 'AGE',
              value: value2,
              onDecrease: value2 > 1 ? () => onValue2Changed(value2 - 1) : null,
              onIncrease:
                  value2 < maxValue2 ? () => onValue2Changed(value2 + 1) : null,
            ),
          ),
        ],
      ),
    );
  }
}
