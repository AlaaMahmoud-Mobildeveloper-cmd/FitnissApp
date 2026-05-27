import 'package:flutter/material.dart';

import 'package:omda_fit/features/chat_ai/data/model/message_model.dart';
import 'package:omda_fit/features/chat_ai/data/soruce/ai_service.dart';


import 'package:omda_fit/features/chat_ai/presentation/widget/chat_header.dart';

import 'package:omda_fit/features/chat_ai/presentation/widget/chat_input_area.dart';

import 'package:omda_fit/features/chat_ai/presentation/widget/chat_messages_list.dart';

class AiChatScreen extends StatefulWidget {

  static const String routeName =
      "AiChatScreen";

  const AiChatScreen({super.key});

  static const backgroundColor =
  Color(0xff090909);

  @override
  State<AiChatScreen> createState() =>
      _AiChatScreenState();
}

class _AiChatScreenState
    extends State<AiChatScreen> {

  final TextEditingController controller =
  TextEditingController();

  final ScrollController scrollController =
  ScrollController();

  final LocalChatBotService aiService =
  LocalChatBotService();

  bool isTyping = false;

  final List<MessageModel> messages = [

    MessageModel(

      text:
      'إزيك يا علاء 💪\nجاهز نكسر تمرين النهاردة؟',

      isUser: false,
    ),
  ];

  Future<void> sendMessage() async {

    if (controller.text.trim().isEmpty) {
      return;
    }

    final userMessage =
    controller.text.trim();

    setState(() {

      messages.add(

        MessageModel(

          text: userMessage,

          isUser: true,
        ),
      );

      isTyping = true;
    });

    controller.clear();

    scrollToBottom();

    final aiResponse =
    await aiService.getReply(userMessage);

    setState(() {

      messages.add(

        MessageModel(

          text: aiResponse,

          isUser: false,
        ),
      );

      isTyping = false;
    });

    scrollToBottom();
  }

  void scrollToBottom() {

    Future.delayed(

      const Duration(milliseconds: 300),

          () {

        if (!scrollController.hasClients) {
          return;
        }

        scrollController.animateTo(

          scrollController.position.maxScrollExtent,

          duration:
          const Duration(milliseconds: 300),

          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  void dispose() {

    controller.dispose();

    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AiChatScreen.backgroundColor,

      resizeToAvoidBottomInset: true,

      body: SafeArea(

        child: Column(

          children: [

            const ChatHeader(),

            Expanded(

              child: ChatMessagesList(

                messages: messages,

                scrollController:
                scrollController,

                isTyping: isTyping,
              ),
            ),

            ChatInputArea(

              controller: controller,

              onSend: sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}