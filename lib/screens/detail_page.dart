import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String foodName;
  final String foodDescription;
  final double foodPrice;
  final double foodRating;
  final String foodImage;

  const DetailPage({
    super.key,
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
    required this.foodRating,
    required this.foodImage,
  });

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  String? selectedArea;
  String? selectedDrink;
  bool withChips = false;
  String? additionalNotes;
  int quantity = 1; // quantity set to start at 1

  final List<String> campusAreas = [
    'North Block',
    'West Block',
    'South Block',
    'East Block'
  ]; //area on campus
  final List<String> drinks = [
    'Coke',
    'Water',
    'Juice',
    'Coffee'
  ]; //drinks menu
  bool showNotesField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.foodName, style: const TextStyle(color: Colors.amber)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section with curved border
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                ),
                child: Image.asset(
                  'assets/menu/${widget.foodImage}', // This will now correctly display the image
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20.0),

              // Name, Price, Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.foodName,
                      style:
                          const TextStyle(color: Colors.amber, fontSize: 22)),
                  Text('R ${widget.foodPrice}',
                      style:
                          const TextStyle(color: Colors.amber, fontSize: 18)),
                  Row(
                    children: List.generate(5, (index) {
                      //rating out of 5 - starts on details page
                      return Icon(
                        index < widget.foodRating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 12.0,
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Description
              Text(widget.foodDescription,
                  style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 16),

              const Divider(color: Colors.amber),

              const SizedBox(height: 20),

              // Chips selection
              const Text('Chips Selection',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                  )),
              RadioListTile(
                title: const Text('With Chips (+ R10)',
                    style: TextStyle(color: Colors.white)),
                value: true,
                groupValue: withChips,
                onChanged: (bool? value) {
                  setState(() {
                    withChips = value!;
                  });
                },
                activeColor: Colors.amber,
              ),

              RadioListTile(
                title: const Text('Without Chips',
                    style: TextStyle(color: Colors.white)),
                value: false,
                groupValue: withChips,
                onChanged: (bool? value) {
                  setState(() {
                    withChips = value!;
                  });
                },
                activeColor: Colors.amber,
              ),
              const Divider(color: Colors.amber),
              const SizedBox(height: 20),

              // Campus area dropdown
              const Text('Select Area on Campus',
                  style: TextStyle(color: Colors.amber)),
              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                dropdownColor: Colors.black,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
                value: selectedArea,
                hint: const Text('Choose Area',
                    style: TextStyle(color: Colors.white)),
                onChanged: (value) {
                  setState(() {
                    selectedArea = value;
                  });
                },
                items: campusAreas.map((area) {
                  return DropdownMenuItem(
                    value: area,
                    child:
                        Text(area, style: const TextStyle(color: Colors.amber)),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Select Drink
              const Text('Select Drink', style: TextStyle(color: Colors.amber)),
              const SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.black,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
                value: selectedDrink,
                hint: const Text('Choose Drink',
                    style: TextStyle(color: Colors.white)),
                onChanged: (value) {
                  setState(() {
                    selectedDrink = value;
                  });
                },
                items: drinks.map((drink) {
                  return DropdownMenuItem(
                    value: drink,
                    child: Text(drink,
                        style: const TextStyle(color: Colors.amber)),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // Add Notes Section
              TextButton(
                onPressed: () {
                  setState(() {
                    showNotesField = !showNotesField;
                  });
                },
                child: const Text('Add Notes',
                    style: TextStyle(color: Colors.amber)),
              ),
              if (showNotesField)
                TextField(
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    setState(() {
                      additionalNotes = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter additional notes',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                  ),
                  maxLines: 3,
                  style: const TextStyle(
                      color: Colors.black), // Ensure text color is visible
                ),

              const SizedBox(height: 16),

              // Quantity Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Text('-', style: TextStyle(fontSize: 24)),
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Text('+', style: TextStyle(fontSize: 24)),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Add to cart Button
              ElevatedButton(
                onPressed: () {
                  // Handle submit action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Center(
                  child: Text('Add to Cart',
                      style: TextStyle(color: Colors.black)),

                ),
              ),
              const SizedBox(height: 20.0,)

            ],
          ),
        ),

      ),
      backgroundColor: Colors.black,
    );

  }
}
