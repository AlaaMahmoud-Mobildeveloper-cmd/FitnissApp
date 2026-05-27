import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omda_fit/features/auth/presentation/screen/login_screen.dart';
import 'package:omda_fit/features/chat_ai/presentation/screen/chat_ai_screen.dart';
import 'package:omda_fit/features/home_screen/presentation/screen/home_screen.dart';
import 'package:omda_fit/features/home_screen/presentation/screen/tab/home_tab.dart';
import 'package:omda_fit/features/home_screen/presentation/screen/tab/nutrition_tab.dart';
import 'core/app_colors.dart';

void main() {
  runApp(const OmdaFitApp());
}

class OmdaFitApp extends StatelessWidget {
  const OmdaFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OmdaFit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.accent,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.surface,
          secondary: AppColors.accent,
        ),
        textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme).apply(
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
        ),
      ),
     initialRoute:HomeScreen.routeName,
     routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
       AiChatScreen.routeName:(context)=>AiChatScreen()
     },
    );
  }
}
