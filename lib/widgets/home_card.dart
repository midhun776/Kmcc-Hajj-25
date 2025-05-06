import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  HomeCard({super.key, required this.title, required this.icon});
  String title;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDF5ED),
        border: Border.all(color: Colors.teal, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Add navigation logic here
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.teal),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
