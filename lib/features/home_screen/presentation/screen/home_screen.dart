import 'package:flutter/material.dart';
import 'package:omda_fit/features/chat_ai/presentation/screen/chat_ai_screen.dart';
import 'package:omda_fit/features/home_screen/presentation/screen/tab/fitness_tab.dart';
import 'package:omda_fit/features/home_screen/presentation/screen/tab/home_tab.dart';
import 'package:omda_fit/features/home_screen/presentation/screen/tab/nutrition_tab.dart';
import 'package:omda_fit/features/home_screen/presentation/screen/tab/profile_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    const HomeTab(),
    const NutritionTab(),
    const FitnessTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffB30000),
          onPressed: (){
          Navigator.pushNamed(context, AiChatScreen.routeName);
          },
        child: Icon(Icons.chat,color: Colors.white,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        backgroundColor: const Color(0xff000000),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Nutrition",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Fitness",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 28,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

}