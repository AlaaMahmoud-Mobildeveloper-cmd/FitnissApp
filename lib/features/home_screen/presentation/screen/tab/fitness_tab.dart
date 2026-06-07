import 'package:flutter/material.dart';

class FitnessTab extends StatelessWidget {
  const FitnessTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> workoutDays = [
      {
        "day": "Monday",
        "focus": "Chest & Triceps",
        "exercises": [
          {
            "name": "Bench Press",
            "sets": 4,
            "reps": 12,
            "image":
            "assets/images/food3.jpg",
          },
          {
            "name": "Push Ups",
            "sets": 3,
            "reps": 20,
            "image":
            "assets/images/food3.jpg",
          },
        ]
      },
      {
        "day": "Tuesday",
        "focus": "Leg Day",
        "exercises": [
          {
            "name": "Squats",
            "sets": 4,
            "reps": 15,
            "image":
            "assets/images/food3.jpg",
          },
          {
            "name": "Lunges",
            "sets": 3,
            "reps": 12,
            "image":
            "assets/images/food3.jpg",
          },
        ]
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Workout Plan",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workoutDays.length,
        itemBuilder: (context, index) {
          final day = workoutDays[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xff1E1E1E),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          day["day"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          day["focus"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 20),

                ...List.generate(
                  day["exercises"].length,
                      (exerciseIndex) {
                    final exercise = day["exercises"][exerciseIndex];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ExerciseDetailsScreen(
                              name: exercise["name"],
                              sets: exercise["sets"],
                              reps: exercise["reps"],
                              image: exercise["image"],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xff2A2A2A),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              child: Image.asset(
                                exercise["image"],
                                width: 110,
                                height: 110,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      exercise["name"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [
                                        buildInfo(
                                          Icons.repeat,
                                          "${exercise["sets"]} Sets",
                                        ),
                                        const SizedBox(width: 16),
                                        buildInfo(
                                          Icons.fitness_center,
                                          "${exercise["reps"]} Reps",
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.red, size: 18),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class ExerciseDetailsScreen extends StatelessWidget {
  final String name;
  final int sets;
  final int reps;
  final String image;

  const ExerciseDetailsScreen({
    super.key,
    required this.name,
    required this.sets,
    required this.reps,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 20,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      detailsCard(
                        Icons.repeat,
                        "$sets Sets",
                      ),
                      const SizedBox(width: 16),
                      detailsCard(
                        Icons.fitness_center,
                        "$reps Reps",
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "Keep your chest up and lower the weight slowly. "
                        "Focus on proper form and controlled movement.",
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.7,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Start Exercise",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget detailsCard(IconData icon, String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xff1E1E1E),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.red),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}