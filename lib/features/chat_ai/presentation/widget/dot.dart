import 'package:flutter/material.dart';

class AnimatedDot extends StatelessWidget {
  final Animation<double> animation;

  const AnimatedDot({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}