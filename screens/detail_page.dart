import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String foodName;
  final String foodDescription;
  final double foodPrice;
  final double foodRating;

  const DetailPage({super.key,
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
    required this.foodRating,
  });

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  double finalPrice = 0.0;
  String selectedArea = '';
  bool addFries = false;

  @override
  void initState() {
    super.initState();
    finalPrice = widget.foodPrice;
  }

  void _updatePrice() {
    setState(() {
      if (addFries) {
        finalPrice = widget.foodPrice + 2.0; // Fries add $2
      } else {
        finalPrice = widget.foodPrice;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.foodName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.foodName, style: const TextStyle(color: Colors.amber, fontSize: 24)),
            const SizedBox(height: 10),
            Text(widget.foodDescription, style: const TextStyle(color: Colors.white)),
            const Divider(color: Colors.amber),
            Text('Price: R ${finalPrice.toStringAsFixed(2)}', style: const TextStyle(color: Colors.amber, fontSize: 18)),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text(widget.foodRating.toString(), style: const TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedArea,
              onChanged: (value) {
                setState(() {
                  selectedArea = value!;
                });
              },
              items: ['North Block', 'South Block', 'East Block', 'West Block'].map((area) {
                return DropdownMenuItem(
                  value: area,
                  child: Text(area, style: const TextStyle(color: Colors.black)),
                );
              }).toList(),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Select Area on Campus',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Add Fries (+\$2)', style: TextStyle(color: Colors.amber)),
                Checkbox(
                  value: addFries,
                  onChanged: (value) {
                    setState(() {
                      addFries = value!;
                      _updatePrice();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
