import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Burgers', 'icon': Icons.fastfood},
    {'name': 'Salads', 'icon': Icons.local_pizza},
    {'name': 'Chicken', 'icon': Icons.ramen_dining},
    {'name': 'Drinks', 'icon': Icons.water_drop_outlined},
  ];

   CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories.map((category) {
          return Column(
            children: [
              Icon(category['icon'], color: Colors.amber, size: 40),
              const SizedBox(height: 5),
              Text(category['name'], style: const TextStyle(color: Colors.amber)),
            ],
          );
        }).toList(),
      ),
    );
  }
}
