import 'package:flutter/material.dart';

class ChatInputArea extends StatelessWidget {

  final TextEditingController controller;

  final VoidCallback onSend;

  const ChatInputArea({
    super.key,
    required this.controller,
    required this.onSend,
  });

  static const darkCardColor = Color(0xff141414);

  static const primaryRed = Color(0xffFF3131);

  static const secondaryRed = Color(0xffB30000);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20),

      child: Row(
        children: [


          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              decoration: BoxDecoration(
                color: darkCardColor,

                borderRadius: BorderRadius.circular(30),

                border: Border.all(
                  color: Colors.red.withOpacity(.15),
                ),
              ),

              child: Row(
                children: [

                  Expanded(
                    child: TextField(
                      controller: controller,

                      style: const TextStyle(
                        color: Colors.white,
                      ),

                      decoration: const InputDecoration(
                        border: InputBorder.none,

                        hintText: 'Ask your coach...',

                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                      ),

                      onSubmitted: (_) {
                        onSend();
                      },
                    ),
                  ),


                  IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.mic,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
            ),
          ),

          const SizedBox(width: 14),


          GestureDetector(
            onTap: onSend,

            child: Container(
              width: 58,
              height: 58,

              decoration: const BoxDecoration(
                shape: BoxShape.circle,

                gradient: LinearGradient(
                  colors: [
                    primaryRed,
                    secondaryRed,
                  ],
                ),
              ),

              child: const Icon(
                Icons.send_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

}