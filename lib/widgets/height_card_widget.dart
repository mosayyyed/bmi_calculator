import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  final double height;
  final ValueChanged<double> onHeightChanged;

  const HeightCard({
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
            const Text('HEIGHT',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(height.round().toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.bold)),
                const Text(' cm',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 15),
                thumbColor: Colors.pink,
                activeTrackColor: Colors.pink,
                inactiveTrackColor: Colors.white,
              ),
              child: Slider(
                value: height,
                min: 100,
                max: 220,
                onChanged: onHeightChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
