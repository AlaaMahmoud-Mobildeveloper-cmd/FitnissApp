import 'package:flutter/material.dart';

class FitnessTab extends StatelessWidget {
  const FitnessTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Fitness Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}