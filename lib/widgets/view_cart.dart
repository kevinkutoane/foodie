import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;
  final bool withChips;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
    this.withChips = false,
  });

  double get totalPrice => (price + (withChips ? 15.0 : 0.0)) * quantity;
}

class ViewCartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const ViewCartPage({super.key, required this.cartItems});

  @override
  _ViewCartPageState createState() => _ViewCartPageState();
}

class _ViewCartPageState extends State<ViewCartPage> {
  double get totalCartPrice {
    return widget.cartItems.fold(
        0.0, (sum, item) => sum + item.totalPrice); // Total price of all items
  }

  void updateQuantity(CartItem item, int quantity) {
    setState(() {
      item.quantity = quantity;
    });
  }

  void removeItem(CartItem item) {
    setState(() {
      widget.cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart', style: TextStyle(color: Colors.amber)),
        backgroundColor: Colors.black,
      ),
      body: widget.cartItems.isEmpty
          ? const Center(
        child: Text('Your cart is empty!',
            style: TextStyle(color: Colors.amber, fontSize: 18)),
      )
          : ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.black,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(item.name,
                    style: const TextStyle(color: Colors.amber)),
                subtitle: Text(
                  'Price: R${item.price.toStringAsFixed(2)} ${item.withChips ? "(With Chips + R15)" : "(No Chips)"}',
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove,
                              color: Colors.amber),
                          onPressed: () {
                            if (item.quantity > 1) {
                              updateQuantity(item, item.quantity - 1);
                            }
                          },
                        ),
                        Text('${item.quantity}',
                            style: const TextStyle(color: Colors.white)),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.amber),
                          onPressed: () {
                            updateQuantity(item, item.quantity + 1);
                          },
                        ),
                      ],
                    ),
                    Text(
                      'R${item.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.amber, fontSize: 16),
                    ),
                  ],
                ),
                leading: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => removeItem(item),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: widget.cartItems.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle checkout process here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: const EdgeInsets.all(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Proceed to Checkout',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                'Total: R${totalCartPrice.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
      )
          : null,
    );
  }
}
