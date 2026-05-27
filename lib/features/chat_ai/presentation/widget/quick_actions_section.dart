import 'package:flutter/material.dart';

import 'quick_action_chip.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        QuickActionChip(title: 'Motivate Me'),
        QuickActionChip(title: 'Workout Advice'),
        QuickActionChip(title: 'Nutrition Help'),
        QuickActionChip(title: 'Missed Workout'),
      ],
    );
  }
}