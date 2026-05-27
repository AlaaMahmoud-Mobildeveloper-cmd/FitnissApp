import 'package:flutter/material.dart';

class NutritionTab extends StatelessWidget {
  const NutritionTab({super.key});

  Widget mealCard({
    required String image,
    required String title,
    required String mealType,
    required String calories,
    required List<String> foods,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: const Color(0xff151821),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            child: Stack(
              children: [
                Image.network(
                  image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.1),
                        Colors.black.withOpacity(.7),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 18,
                  right: 18,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 22,
                  left: 22,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius:
                          BorderRadius.circular(30),
                        ),
                        child: Text(
                          mealType,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                /// CALORIES
                Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      color: Colors.orange,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      calories,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// FOODS
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: foods.map((food) {
                    return Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(.05),
                        borderRadius:
                        BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white
                              .withOpacity(.05),
                        ),
                      ),
                      child: Text(
                        food,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                /// BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Colors.redAccent,
                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            18),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "View Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0C10),

      appBar: AppBar(
        backgroundColor: const Color(0xff0B0C10),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Nutrition Plan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [

          /// BREAKFAST
          mealCard(
            image:
            "https://images.unsplash.com/photo-1528207776546-365bb710ee93",
            title: "Blueberry Pancake",
            mealType: "Breakfast",
            calories: "520 kcal",
            foods: [
              "Eggs",
              "Oats",
              "Banana",
              "Milk",
            ],
          ),

          /// LUNCH
          mealCard(
            image:
            "https://images.unsplash.com/photo-1532550907401-a500c9a57435",
            title: "Chicken Rice Bowl",
            mealType: "Lunch",
            calories: "780 kcal",
            foods: [
              "Chicken",
              "Rice",
              "Vegetables",
              "Olive Oil",
            ],
          ),

          /// DINNER
          mealCard(
            image:
            "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2",
            title: "Healthy Salmon",
            mealType: "Dinner",
            calories: "600 kcal",
            foods: [
              "Salmon",
              "Sweet Potato",
              "Avocado",
            ],
          ),
        ],
      ),
    );
  }
}