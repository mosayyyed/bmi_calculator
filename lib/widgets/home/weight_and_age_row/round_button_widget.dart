import 'dart:async';

import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const RoundButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  RoundButtonState createState() => RoundButtonState();
}

class RoundButtonState extends State<RoundButton> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        widget.onPressed?.call();
        _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
          widget.onPressed?.call();
        });
      },
      onTapUp: (_) => _timer?.cancel(),
      onTapCancel: () => _timer?.cancel(),
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
