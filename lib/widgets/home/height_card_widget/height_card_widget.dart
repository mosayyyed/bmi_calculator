import 'package:flutter/material.dart';

import 'height_display.dart';
import 'increment_decrement_button.dart';

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
                HeightDisplay(height: height),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IncrementDecrementButton(
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
                  IncrementDecrementButton(
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
