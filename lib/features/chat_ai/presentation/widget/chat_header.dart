import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  static const primaryRed = Color(0xffFF3131);
  static const secondaryRed = Color(0xffB30000);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  primaryRed,
                  secondaryRed,
                ],
              ),
            ),
            child: const Icon(
              Icons.fitness_center,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 14),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Coach AI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Online',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),

          const Spacer(),

          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.04),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}