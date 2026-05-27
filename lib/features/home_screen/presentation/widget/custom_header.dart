import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String date;
  final String title;

  const CustomHeader({super.key, required this.date, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(Icons.bolt, color: Colors.yellow),
      ),
      title: Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      subtitle: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      trailing: IconButton(
        icon: const Icon(Icons.notifications_none_outlined, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}