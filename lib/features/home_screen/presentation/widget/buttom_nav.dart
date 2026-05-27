import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff16181D),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.home_filled,
              color:Color(0xffB30000),
              size: 30,
            ),
            Icon(
              Icons.bar_chart,
              color: Colors.grey,
              size: 28,
            ),
            Icon(
              Icons.fitness_center,
              color: Colors.grey,
              size: 28,
            ),
            Icon(
              Icons.person,
              color: Colors.grey,
              size: 28,
            ),
          ],
        ),
      );
  }
}
