import 'package:flutter/material.dart';
import 'package:omda_fit/features/auth/presentation/screen/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static String routeName = "OnboardingScreen";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {
  final PageController pageController =
  PageController();

  int currentIndex = 0;


  final List<Map<String, String>>
  onboardingData = [

    {
      "image": "assets/images/IMG2.JPG",

      "title": "حوّل جسمك إلى مستوى آخر",

      "description":
      "ابدأ رحلتك نحو القوة واللياقة مع خطط تدريب احترافية مصممة خصيصًا لتحقيق أهدافك.",
    },

    {
      "image":
      "assets/images/onboarding2.jpg",

      "title":
      "نظام غذائي ذكي ومتوازن",

      "description":
      "احصل على وجبات محسوبة بدقة وتتبع كامل للسعرات والبروتين والكارب لبناء جسم مثالي.",
    },

    {
      "image": "assets/images/IMG1.JPG",

      "title": "تابع تقدمك يوم بعد يوم",

      "description":
      "راقب نتائجك، التزم بخطتك التدريبية، وشاهد تطور جسمك وتحسن أدائك باستمرار.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [

          PageView.builder(
            controller: pageController,
            itemCount: onboardingData.length,

            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            itemBuilder:
                (context, index) {
              final item = onboardingData[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    item["image"]!,
                    fit: BoxFit.cover,
                  ),

                  Column(

                    children: [
                      Container(
                        height: 320,
                        decoration:
                        BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(.9),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      const Spacer(),

                      Container(
                        height: 420,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(.97),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SafeArea(
                    child: Padding(
                      padding:
                      const EdgeInsets
                          .symmetric(
                        horizontal: 24,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [

                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(item["title"]!,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 42,
                                  height:
                                  1.1,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),

                              const SizedBox(
                                  height:
                                  20),

                              Text(
                                item[
                                "description"]!,
                                textAlign: TextAlign.end,
                                style:
                                TextStyle(
                                  color: Colors
                                      .white
                                      .withOpacity(
                                      .75),
                                  fontSize:
                                  16,
                                  height:
                                  1.8,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                              height: 150),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          SafeArea(
            child: Padding(
              padding:
              const EdgeInsets
                  .symmetric(
                horizontal: 20,
                vertical: 20,
              ),

              child: Column(
                children: [

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                    children: [

                      Image.asset(
                        "assets/images/logo.png",
                        width: 170,
                        fit:
                        BoxFit.contain,
                      ),

                      TextButton(
                        onPressed: () {},

                        child:
                        const Text(
                          "Skip",
                          style:
                          TextStyle(
                            color: Colors
                                .white,
                            fontSize: 15,
                            fontWeight:
                            FontWeight
                                .w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    children: [

                      Expanded(
                        child: Row(
                          children:
                          List.generate(
                            onboardingData
                                .length,
                                (indicatorIndex) {

                              final isActive =
                                  currentIndex ==
                                      indicatorIndex;

                              return AnimatedContainer(
                                duration:
                                const Duration(
                                  milliseconds:
                                  350,
                                ),

                                margin:
                                const EdgeInsets
                                    .only(
                                  right: 8,
                                ),

                                width:
                                isActive
                                    ? 34
                                    : 10,

                                height: 10,

                                decoration:
                                BoxDecoration(
                                  color:
                                  isActive
                                      ? Colors
                                      .red
                                      : Colors
                                      .white24,

                                  borderRadius:
                                  BorderRadius.circular(
                                    30,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {

                          if (currentIndex == onboardingData.length - 1) {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          } else {
                            pageController.nextPage(duration:
                              const Duration(milliseconds: 500,
                              ),
                              curve: Curves.easeInOut,
                            );
                          }
                        },

                        child:
                        Container(
                          width: 72,
                          height: 72,

                          decoration:
                          BoxDecoration(
                            color:
                            Colors.red,

                            borderRadius:
                            BorderRadius.circular(
                              24,
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors
                                    .red
                                    .withOpacity(
                                    .4),

                                blurRadius:
                                20,

                                offset:
                                const Offset(
                                  0,
                                  10,
                                ),
                              )
                            ],
                          ),

                          child: Icon(
                            currentIndex ==
                                onboardingData.length -
                                    1
                                ? Icons
                                .check_rounded
                                : Icons
                                .arrow_forward_rounded,

                            color:
                            Colors.white,

                            size: 32,
                          ),
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