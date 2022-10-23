import 'dart:math';

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Color color;
  final double size;

  const Logo({
    super.key, 
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 4,
      child: Icon(
        Icons.music_note_rounded,
        color: color,
        size: size,
      ),
    );
  }
}
