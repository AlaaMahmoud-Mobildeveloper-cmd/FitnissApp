import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const ProgramCard({super.key,required this.color, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_circle_right_outlined, color: Colors.grey),
              Icon(icon, size: 40, color: Colors.grey.withOpacity(0.2)),
            ],
          )
        ],
      ),
    );
  }
}