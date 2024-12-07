import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;

  const GradientText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28, // Bold and prominent for visibility
        fontWeight: FontWeight.w900,
        letterSpacing: 1.3, // Slight letter spacing for readability
        foreground: Paint()
          ..shader = LinearGradient(
            colors: <Color>[
              Colors.cyan.shade300, // Bright cyan for freshness
              const Color.fromARGB(255, 129, 11, 80), // Vibrant orange for energy
            ],
            begin: Alignment.topLeft, // Gradient flow from top-left
            end: Alignment.bottomRight, // To bottom-right for smooth transition
          ).createShader(
            const Rect.fromLTWH(0.0, 0.0, 400.0, 100.0), // Gradient covers the width of the text
          ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
