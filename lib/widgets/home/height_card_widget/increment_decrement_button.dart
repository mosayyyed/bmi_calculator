import 'dart:async';

import 'package:flutter/material.dart';

class IncrementDecrementButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const IncrementDecrementButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  IncrementDecrementButtonState createState() =>
      IncrementDecrementButtonState();
}

class IncrementDecrementButtonState extends State<IncrementDecrementButton> {
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
