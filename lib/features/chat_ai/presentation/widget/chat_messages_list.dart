import 'package:flutter/material.dart';

import '../../data/model/message_model.dart';

import 'ai_message_bubble.dart';
import 'quick_actions_section.dart';
import 'typing_indicator.dart';
import 'user_message_bubble.dart';

class ChatMessagesList extends StatelessWidget {

  final List<MessageModel> messages;

  final ScrollController scrollController;

  final bool isTyping;

  const ChatMessagesList({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.isTyping,
  });

  @override
  Widget build(BuildContext context) {

    return ListView.builder(

      controller: scrollController,

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),

      itemCount: messages.length + 2,

      itemBuilder: (context, index) {

        ////////////////////////////////////////////////////////
        /// QUICK ACTIONS
        ////////////////////////////////////////////////////////

        if (index == messages.length) {

          return const Padding(
            padding: EdgeInsets.only(top: 20),
            child: QuickActionsSection(),
          );
        }

        ////////////////////////////////////////////////////////
        /// TYPING
        ////////////////////////////////////////////////////////

        if (index == messages.length + 1) {

          if (!isTyping) {
            return const SizedBox();
          }

          return const Padding(
            padding: EdgeInsets.only(top: 20),
            child: TypingIndicator(),
          );
        }

        ////////////////////////////////////////////////////////
        /// MESSAGE
        ////////////////////////////////////////////////////////

        final message = messages[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),

          child: message.isUser

              ? UserMessageBubble(
            text: message.text,
          )

              : AiMessageBubble(
            text: message.text,
          ),
        );
      },
    );
  }
}