import 'package:flutter/material.dart';
import '../screens/detail_page.dart';

class FoodSearch extends SearchDelegate<String> {
  // Sample food data with all required details
  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Burger',
      'image': 'burger.jpg',
      'price': 10.99,
      'rating': 4.5,
      'description': 'A juicy burger with lettuce, tomato, and cheese.'
    },
    {
      'name': 'Pizza',
      'image': 'pizza.jpg',
      'price': 12.99,
      'rating': 4.2,
      'description': 'A delicious pizza topped with mozzarella and pepperoni.'
    },
    {
      'name': 'Sushi',
      'image': 'sushi.jpg',
      'price': 15.99,
      'rating': 4.8,
      'description': 'Fresh sushi with salmon, avocado, and cucumber.'
    },
  ];

  // List of recent searches
  final List<String> recentSearches = ['Burger', 'Pizza'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for the search bar (clear button)
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Colors.amber),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon (back button) on the left of the search bar
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.amber),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show results based on the search query
    final results = foodItems
        .where((food) => food['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final foodItem = results[index];

        return ListTile(
          leading: Image.asset('assets/images/${foodItem['image']}', width: 50, height: 50, fit: BoxFit.cover),
          title: Text(foodItem['name'], style: const TextStyle(color: Colors.amber)),
          subtitle: Text('\$${foodItem['price']}', style: const TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  foodName: foodItem['name'],
                  foodDescription: foodItem['description'],
                  foodPrice: foodItem['price'],
                  foodRating: foodItem['rating'],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Suggestions shown as the user types in the search bar
    final suggestions = query.isEmpty
        ? recentSearches
        : foodItems
        .where((food) => food['name']!.toLowerCase().startsWith(query.toLowerCase()))
        .map((food) => food['name']!)
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion, style: const TextStyle(color: Colors.amber)),
          onTap: () {
            query = suggestion;
            showResults(context);  // Show results for the selected suggestion
          },
        );
      },
    );
  }
}
