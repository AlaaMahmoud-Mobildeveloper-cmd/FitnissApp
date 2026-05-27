import 'package:flutter/material.dart';
import 'package:omda_fit/features/chat_ai/presentation/widget/dot.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;

  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      controller2.repeat(reverse: true);
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      controller3.repeat(reverse: true);
    });

    animation1 = Tween<double>(
      begin: 0.3,
      end: 1,
    ).animate(controller1);

    animation2 = Tween<double>(
      begin: 0.3,
      end: 1,
    ).animate(controller2);

    animation3 = Tween<double>(
      begin: 0.3,
      end: 1,
    ).animate(controller3);
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff141414),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.red.withOpacity(.1),
            ),
          ),
          child: Row(
            children: [
              AnimatedDot(animation: animation1),

              const SizedBox(width: 5),

              AnimatedDot(animation: animation2),

              const SizedBox(width: 5),

              AnimatedDot(animation: animation3),
            ],
          ),
        )
      ],
    );
  }
}

