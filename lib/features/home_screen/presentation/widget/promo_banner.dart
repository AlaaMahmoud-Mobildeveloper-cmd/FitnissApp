import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("PROVIDE AN\nEXCEPTIONAL\nSERVICE.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: StadiumBorder(),
                  ),
                  child: const Text("Get Started", style: TextStyle(color: Colors.yellow, fontSize: 12)),
                )
              ],
            ),
          ),
          // هنا يمكنك إضافة الصورة كما في 77.jpeg
          Positioned(
            right: 10,
            bottom: 0,
            child: Icon(Icons.directions_run, size: 120, color: Colors.grey.withOpacity(0.3)),
          )
        ],
      ),
    );
  }
}