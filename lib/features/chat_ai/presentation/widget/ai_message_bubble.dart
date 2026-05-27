import 'package:flutter/material.dart';

import 'ai_avatar.dart';

class AiMessageBubble extends StatelessWidget {
  final String text;

  const AiMessageBubble({
    super.key,
    required this.text,
  });

  static const darkCardColor = Color(0xff141414);
  static const borderColor = Color(0xff2A2A2A);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AiAvatar(),

        const SizedBox(width: 12),

        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .72,
          ),

          child: Container(
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: darkCardColor,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: borderColor,
              ),
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