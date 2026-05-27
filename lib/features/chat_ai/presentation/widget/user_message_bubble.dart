import 'package:flutter/material.dart';

class UserMessageBubble extends StatelessWidget {
  final String text;

  const UserMessageBubble({
    super.key,
    required this.text,
  });

  static const primaryRed = Color(0xffFF3131);
  static const secondaryRed = Color(0xffB30000);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .72,
          ),

          child: Container(
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  primaryRed,
                  secondaryRed,
                ],
              ),

              borderRadius: BorderRadius.circular(22),
            ),

            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
        )
      ],
    );
  }
}