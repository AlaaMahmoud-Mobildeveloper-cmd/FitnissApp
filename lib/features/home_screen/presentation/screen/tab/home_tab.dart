import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  Widget statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff16181D),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withOpacity(.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),

          const Spacer(),

          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(.5),
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 8),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff0B0C10),

      /// مهم علشان يمنع overflow
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              children: [

                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: const Text(
                              "Hello Ahmed 👋",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            "Push harder than yesterday",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xff1A1C22),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 28),

                /// MAIN CARD
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    minHeight: 220,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffFC4A1A),
                        Color(0xffAF002D),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.15),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "🔥 Today's Workout",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Chest Day",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Focus • Strength • Growth",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 28),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Start Workout",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// RESPONSIVE GRID
                GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,

                  /// مهم جدا
                  physics: const NeverScrollableScrollPhysics(),

                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width < 600 ? 2 : 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,

                    /// حل overflow
                    childAspectRatio: .95,
                  ),
                  itemBuilder: (context, index) {
                    final items = [
                      {
                        "title": "Calories",
                        "value": "2200",
                        "icon": Icons.local_fire_department,
                        "color": Colors.orange,
                      },
                      {
                        "title": "Water",
                        "value": "2.5L",
                        "icon": Icons.water_drop,
                        "color": Colors.blue,
                      },
                      {
                        "title": "Weight",
                        "value": "78KG",
                        "icon": Icons.monitor_weight,
                        "color": Colors.greenAccent,
                      },
                      {
                        "title": "Steps",
                        "value": "8.2K",
                        "icon": Icons.directions_walk,
                        "color": Colors.purpleAccent,
                      },
                    ];

                    return statCard(
                      title: items[index]["title"] as String,
                      value: items[index]["value"] as String,
                      icon: items[index]["icon"] as IconData,
                      color: items[index]["color"] as Color,
                    );
                  },
                ),

                const SizedBox(height: 24),

         
              ],
            ),
          ),
        ),
      ),
    );
  }
}