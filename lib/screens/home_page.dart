import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

import '../search/search_page.dart';
import '../widgets/category_section.dart';
import 'detail_page.dart'; // Assuming the search page is already implemented

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.amber)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
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

            const SizedBox(height: 15),
            // Category Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Categories',
                  style: TextStyle(color: Colors.amber, fontSize: 18)),
            ),
            const SizedBox(height: 15),
            CategorySection(),
            const SizedBox(height: 15),

            // Popular Foods Section (Horizontal Scroll)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Popular Foods',
                  style: TextStyle(color: Colors.amber, fontSize: 18)),
            ),
            SizedBox(
              height: 200, // Set height for the horizontal list
              child: PopularFoodsCarousel(),
            ),

            // New Arrivals Section (Horizontal Scroll)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text('New Arrivals',
                  style: TextStyle(color: Colors.amber, fontSize: 18)),
            ),
            SizedBox(
              height: 200,
              child: NewArrivalsCarousel(),
            ),

            // Food Cards Section (Scroll Vertically)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('All Foods',
                  style: TextStyle(color: Colors.amber, fontSize: 18)),
            ),
            // Add more food cards or ListView for dynamic data here
            AllFoodsSection(),
            // const BottomNavbar(),
          ],
        ),
      ),
      backgroundColor: Colors.black26,
    );
  }
}

class PopularFoodsCarousel extends StatelessWidget {
  // Dummy list of popular foods (replace with actual data)
  final List<Map<String, dynamic>> popularFoods = [
    {
      'name': 'Burger',
      'image': 'burger.jpg',
      'price': '10.99',
      'description':
      'A delicious, juicy beef burger with fresh lettuce and tomato.',
      'rating': 2.5
    },
    {
      'name': 'Chicken',
      'image': 'chicken.jpg',
      'price': '12.99',
      'description': 'Crispy fried chicken served with a side of fries.',
      'rating': 3.2
    },
    {
      'name': 'Pasta Salad',
      'image': 'pasta_salad.jpg',
      'price': '8.99',
      'description': 'Creamy pasta salad with fresh vegetables.',
      'rating': 4.5
    },
    {
      'name': 'Braaiday Friday',
      'image': 'steak.jpg',
      'price': '8.99',
      'description': 'Fridays are for braaing - order as meal of the day!',
      'rating': 3.4
    },
  ];

  PopularFoodsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    // Convert popularFoods to a list of BannerModel
    List<BannerModel> banners = popularFoods.map((food) {
      return BannerModel(
        imagePath: 'assets/menu/${food['image']}',  // Adjust the image path
        id: food['name'],
      );
    }).toList();

    return BannerCarousel(
      banners: banners,
      height: 200,
      borderRadius: 10,
      showIndicator: true,
      activeColor: Colors.amber,
      disableColor: Colors.white,
      animation: true,
      onTap: (id) {
        final selectedFood =
        popularFoods.firstWhere((food) => food['name'] == id);

        double price = double.parse(selectedFood['price']);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              foodName: selectedFood['name'],
              foodDescription: selectedFood['description'],
              foodPrice: price,
              foodRating: selectedFood['rating'],
              foodImage: selectedFood['image'],
            ),
          ),
        );
      },
    );
  }
}

//new arrivals carousel
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
              Text('R ${food['price']}',
                  style: const TextStyle(color: Colors.amber)),
            ],
          ),
        );
      },
    );
  }
}

//All foods section
class AllFoodsSection extends StatelessWidget {
  // Dummy list of all foods with descriptions and ratings
  final List<Map<String, dynamic>> allFoods = [
    {
      'name': 'Burger',
      'image': 'burger.jpg',
      'price': '10.99',
      'description':
          'A delicious, juicy beef burger with fresh lettuce and tomato.',
      'rating': 2.5
    },
    {
      'name': 'Chicken',
      'image': 'chicken.jpg',
      'price': '12.99',
      'description': 'Crispy fried chicken served with a side of fries.',
      'rating': 3.2
    },
    {
      'name': 'Pasta Salad',
      'image': 'pasta_salad.jpg',
      'price': '8.99',
      'description': 'Creamy pasta salad with fresh vegetables.',
      'rating': 4.5
    },
    {
      'name': 'Braaiday Friday',
      'image': 'steak.jpg',
      'price': '8.99',
      'description': 'Fridays are for braaing - order as meal of the day!',
      'rating': 3.4
    },
  ];

  AllFoodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 3 / 4,
      ),
      itemCount: allFoods.length,
      itemBuilder: (context, index) {
        final food = allFoods[index];
        return GestureDetector(
          onTap: () {
            // Convert price from String to double
            double price = double.parse(food['price']);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  foodName: food['name'],
                  foodDescription: food['description'],
                  foodPrice: price, // Pass price as a double
                  foodRating: food['rating'], foodImage: food['image'],
                ),
              ),
            );
          },
          child: Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  child: Image.asset(
                    'assets/menu/${food['image']}',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'R ${food['price']}',
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 14.0,
                        ),
                      ),

                      // Rating Stars
                      Row(
                        children: List.generate(5, (starIndex) {
                          // Check if this star should be filled
                          if (starIndex < food['rating']) {
                            return const Icon(Icons.star,
                                color: Colors.amber, size: 12);
                          } else if (starIndex < food['rating'] + 0.5) {
                            // For half-star ratings (optional)
                            return const Icon(Icons.star_half,
                                color: Colors.amber, size: 12);
                          } else {
                            return const Icon(Icons.star_border,
                                color: Colors.amber, size: 12);
                          }
                        }),
                      ),
                      const SizedBox(height: 10.0,),
                    ],
                  ),
                ),
              ],
            ),
          ),

        );
      },
    );

  }
}
