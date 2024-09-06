import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final double rating;
  final VoidCallback onTap;

  const FoodCard({super.key, required this.name, required this.image, required this.price, required this.rating, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/menu/$image',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(color: Colors.amber)),
            Text('\$$price', style: const TextStyle(color: Colors.white)),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text(rating.toString(), style: const TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
