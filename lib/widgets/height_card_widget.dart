import 'dart:async';

import 'package:flutter/material.dart';

class HeightSelectorCard extends StatelessWidget {
  final double height;
  final ValueChanged<double> onHeightChanged;

  const HeightSelectorCard({
    super.key,
    required this.height,
    required this.onHeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff323244),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  'HEIGHT',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                _HeightDisplay(height: height),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _IncrementDecrementButton(
                    icon: Icons.remove,
                    onPressed: () =>
                        onHeightChanged((height - 1).clamp(100.0, 220.0)),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 8),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 20),
                        thumbColor: Colors.pink,
                        activeTrackColor: Colors.pink,
                        inactiveTrackColor: Colors.white,
                      ),
                      child: Slider(
                        value: height.clamp(100.0, 220.0),
                        min: 100,
                        max: 220,
                        onChanged: onHeightChanged,
                      ),
                    ),
                  ),
                  _IncrementDecrementButton(
                    icon: Icons.add,
                    onPressed: () =>
                        onHeightChanged((height + 1).clamp(100.0, 220.0)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeightDisplay extends StatelessWidget {
  final double height;

  const _HeightDisplay({required this.height});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: height.round().toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 55,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: ' cm',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _IncrementDecrementButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _IncrementDecrementButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  _IncrementDecrementButtonState createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<_IncrementDecrementButton> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startTimer(),
      onTapUp: (_) => _timer?.cancel(),
      onTapCancel: () => _timer?.cancel(),
      child: IconButton(
        iconSize: 30,
        icon: Icon(widget.icon, color: Colors.white),
        onPressed: widget.onPressed,
      ),
    );
  }

  void _startTimer() {
    widget.onPressed();
    _timer = Timer.periodic(
        const Duration(milliseconds: 100), (_) => widget.onPressed());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
