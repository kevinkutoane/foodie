import 'package:flutter/material.dart';

import '../search/search_page.dart'; // Assuming the search page is already implemented

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.amber, fontSize: 22), textAlign: TextAlign.center,),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for food...',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search, color: Colors.amber),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onTap: () {
                  showSearch(context: context, delegate: FoodSearch());
                },
              ),
            ),

            // Popular Foods Section (Horizontal Scroll)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Popular Foods', style: TextStyle(color: Colors.amber, fontSize: 18)),
            ),
            SizedBox(
              height: 200, // Set height for the horizontal list
              child: PopularFoodsCarousel(),
            ),

            // New Arrivals Section (Horizontal Scroll)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text('New Arrivals', style: TextStyle(color: Colors.amber, fontSize: 18)),
            ),
            SizedBox(
              height: 200,
              child: NewArrivalsCarousel(),
            ),

            // Category Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Categories', style: TextStyle(color: Colors.amber, fontSize: 18)),
            ),
            CategorySection(),

            // Food Cards Section (Scroll Vertically)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('All Foods', style: TextStyle(color: Colors.amber, fontSize: 18)),
            ),
            // Add more food cards or ListView for dynamic data here
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class PopularFoodsCarousel extends StatelessWidget {
  // Dummy list of popular foods (replace with actual data)
  final List<Map<String, dynamic>> popularFoods = [
    {'name': 'Burger', 'image': 'burger.jpg', 'price': '10.99'},
    {'name': 'Chicken', 'image': 'chicken.jpg', 'price': '12.99'},
    {'name': 'Fruit Salad', 'image': 'fruit_salad.jpg', 'price': '15.99'},
  ];

  PopularFoodsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: popularFoods.length,
      itemBuilder: (context, index) {
        final food = popularFoods[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/menu/${food['image']}',
                  width: 150,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(food['name']!, style: const TextStyle(color: Colors.white)),
              Text('\$${food['price']}', style: const TextStyle(color: Colors.amber)),
            ],
          ),
        );
      },
    );
  }
}

class NewArrivalsCarousel extends StatelessWidget {
  // Dummy list of new arrivals (replace with actual data)
  final List<Map<String, String>> newArrivals = [
    {'name': 'Plate', 'image': 'cooked_food.jpg', 'price': '8.99'},
    {'name': 'Pasta', 'image': 'pasta_salad.jpg', 'price': '11.99'},
    {'name': 'Steak', 'image': 'steak.jpg', 'price': '7.99'},
  ];

   NewArrivalsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: newArrivals.length,
      itemBuilder: (context, index) {
        final food = newArrivals[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/menu/${food['image']}',
                  width: 150,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(food['name']!, style: const TextStyle(color: Colors.white)),
              Text('R ${food['price']}', style: const TextStyle(color: Colors.amber)),
            ],
          ),
        );
      },
    );
  }
}

class CategorySection extends StatelessWidget {
  // Dummy categories (replace with actual data)
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.fastfood, 'label': 'Fast Food'},
    {'icon': Icons.local_pizza, 'label': 'Pizza'},
    {'icon': Icons.rice_bowl, 'label': 'Asian'},
  ];

   CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            children: [
              Icon(category['icon'], size: 40, color: Colors.amber),
              const SizedBox(height: 8),
              Text(category['label'], style: const TextStyle(color: Colors.white)),
            ],
          );
        },
      ),
    );
  }
}