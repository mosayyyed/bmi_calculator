import 'dart:async';

import 'package:flutter/material.dart';

class WeightAndAgeRow extends StatelessWidget {
  final int weight;
  final int age;
  final ValueChanged<int> onWeightChanged;
  final ValueChanged<int> onAgeChanged;

  // Define maxWeight and maxAge constants
  static const int maxWeight = 150;
  static const int maxAge = 100;

  const WeightAndAgeRow({
    super.key,
    required this.weight,
    required this.age,
    required this.onWeightChanged,
    required this.onAgeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: _ValueCard(
              label: 'WEIGHT',
              value: weight,
              onDecrease:
                  weight > 30 ? () => onWeightChanged(weight - 1) : null,
              onIncrease:
                  weight < maxWeight ? () => onWeightChanged(weight + 1) : null,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _ValueCard(
              label: 'AGE',
              value: age,
              onDecrease: age > 1 ? () => onAgeChanged(age - 1) : null,
              onIncrease: age < maxAge ? () => onAgeChanged(age + 1) : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;

  const _ValueCard({
    required this.label,
    required this.value,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff323244),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500)),
          Text(value.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _RoundIconButton(
                icon: Icons.remove,
                onPressed: onDecrease,
              ),
              const SizedBox(width: 10),
              _RoundIconButton(
                icon: Icons.add,
                onPressed: onIncrease,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _RoundIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  _RoundIconButtonState createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<_RoundIconButton> {
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
          widget.onPressed?.call();
        });
      },
      onTapUp: (_) {
        _timer.cancel();
      },
      onTapCancel: () {
        _timer.cancel();
      },
      child: RawMaterialButton(
        onPressed: widget.onPressed,
        elevation: 6.0,
        constraints: const BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
        child: Icon(widget.icon, color: Colors.white),
      ),
    );
  }
}
