import 'package:flutter/material.dart';

class QuickActionChip extends StatelessWidget {
  final String title;

  const QuickActionChip({
    super.key,
    required this.title,
  });

  static const lightBlack = Color(0xff1B1B1B);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: lightBlack,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.red.withOpacity(.15),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}