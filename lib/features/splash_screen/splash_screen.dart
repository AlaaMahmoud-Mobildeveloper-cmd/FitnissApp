import 'dart:async';

import 'package:flutter/material.dart';
import 'package:omda_fit/features/onbord/presentation/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {

  static String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController logoController;

  late AnimationController textController;

  late AnimationController glowController;

  late Animation<double> logoScale;

  late Animation<double> logoOpacity;

  late Animation<Offset> textAnimation;

  late Animation<double> glowAnimation;

  @override
  void initState() {

    super.initState();

    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    logoScale = Tween<double>(
      begin: .6,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.elasticOut,
      ),
    );

    logoOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.easeIn,
      ),
    );

    textAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: textController,
        curve: Curves.easeOutExpo,
      ),
    );

    glowAnimation = Tween<double>(
      begin: 10,
      end: 28,
    ).animate(
      CurvedAnimation(
        parent: glowController,
        curve: Curves.easeInOut,
      ),
    );

    logoController.forward();

    Future.delayed(
      const Duration(milliseconds: 700),
          () {
        textController.forward();
      },
    );

    Timer(
      const Duration(seconds: 5),
          () {

       Navigator.pushReplacementNamed(
           context,
           OnboardingScreen.routeName,
         );
      },
    );
  }

  @override
  void dispose() {

    logoController.dispose();

    textController.dispose();

    glowController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xff050505),

      body: Stack(
        fit: StackFit.expand,

        children: [

          Image.asset(
            "assets/images/IMG7.JPG",
            fit: BoxFit.cover,
          ),

          Container(
            decoration: BoxDecoration(

              gradient: LinearGradient(

                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: [

                  Colors.black.withOpacity(.45),

                  Colors.black.withOpacity(.96),
                ],
              ),
            ),
          ),

          Positioned(
            top: -120,
            right: -80,

            child: AnimatedBuilder(

              animation: glowAnimation,

              builder: (context, child) {

                return Container(

                  width: 260,
                  height: 260,

                  decoration: BoxDecoration(

                    shape: BoxShape.circle,

                    color: Colors.red.withOpacity(.12),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.red.withOpacity(.35),
                        blurRadius: glowAnimation.value,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          SafeArea(

            child: Padding(

              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 40,
              ),

              child: Column(
                children: [

                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                  FadeTransition(

                    opacity: logoOpacity,

                    child: ScaleTransition(

                      scale: logoScale,

                      child: Column(
                        children: [

                          Container(

                            padding: const EdgeInsets.all(24),

                            decoration: BoxDecoration(

                              color:
                              Colors.white.withOpacity(.05),

                              shape: BoxShape.circle,

                              border: Border.all(
                                color:
                                Colors.white.withOpacity(.08),
                              ),

                              boxShadow: [

                                BoxShadow(
                                  color:
                                  Colors.black.withOpacity(.30),

                                  blurRadius: 30,

                                  spreadRadius: 5,
                                ),
                              ],
                            ),

                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 130,
                            ),
                          ),

                          const SizedBox(height: 40),

                          SlideTransition(

                            position: textAnimation,

                            child: Column(
                              children: [

                                const Text(

                                  "حوّل جسمك إلى قوة حقيقية",

                                  textAlign: TextAlign.center,

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    height: 1.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 18),

                                Text(

                                  "خطط تدريب احترافية، تغذية ذكية، ومتابعة مستمرة لتحقيق أفضل نسخة منك",

                                  textAlign: TextAlign.center,

                                  style: TextStyle(
                                    color:
                                    Colors.white.withOpacity(.72),

                                    fontSize: 16,

                                    height: 1.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  Column(
                    children: [

                      SizedBox(

                        width: 34,
                        height: 34,

                        child: CircularProgressIndicator(
                          color: Colors.red,
                          strokeWidth: 3,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Text(

                        "Loading...",

                        style: TextStyle(
                          color:
                          Colors.white.withOpacity(.7),

                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}