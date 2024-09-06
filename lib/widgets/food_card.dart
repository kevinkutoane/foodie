import 'package:flutter/material.dart';

import '../screens/detail_page.dart';


class FoodCard extends StatelessWidget {
  final String foodName;
  final String foodDescription;
  final double foodPrice;
  final double foodRating;
  final String imagePath; // Local image path for the food

  const FoodCard({super.key,
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
    required this.foodRating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to DetailsPage and pass required arguments
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              foodName: foodName,
              foodDescription: foodDescription,
              foodPrice: foodPrice,
              foodRating: foodRating,
              foodImage: imagePath,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.black,
        child: Column(
          children: [
            // Food Image (locally stored)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath, // Local path to the food image
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              foodName,
              style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${foodPrice.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              'Rating: ${foodRating.toString()}/5',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
