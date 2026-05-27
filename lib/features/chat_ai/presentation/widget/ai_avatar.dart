import 'package:flutter/material.dart';

class AiAvatar extends StatelessWidget {
  const AiAvatar({super.key});

  static const primaryRed = Color(0xffFF3131);
  static const secondaryRed = Color(0xffB30000);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [
            primaryRed,
            secondaryRed,
          ],
        ),
      ),
      child: const Icon(
        Icons.smart_toy,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}