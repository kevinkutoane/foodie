import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  // Dummy categories (replace with actual data)
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.fastfood, 'label': 'Fast Food'},
    {'icon': Icons.local_pizza, 'label': 'Healthy'},
    {'icon': Icons.rice_bowl, 'label': 'Meals'},
    {'icon': Icons.icecream, 'label': 'Desserts'},
    {'icon': Icons.local_drink, 'label': 'Drinks'},
    {'icon': Icons.local_cafe, 'label': 'Cafes'},
    // Add more categories as needed
  ];

  CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 30,
                  child: Icon(category['icon'], size: 30, color: Colors.black),
                ),
                const SizedBox(height: 8),
                Text(
                  category['label'],
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
