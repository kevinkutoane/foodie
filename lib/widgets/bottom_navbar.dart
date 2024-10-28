import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../screens/home_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  BottomNavbarState createState() => BottomNavbarState();
}

class BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    const HomePage(),  // Assuming HomePage is defined elsewhere
    const GrabNGoPage(),  // Assuming GrabNGoPage is defined elsewhere

    const ProfilePage(),  // Assuming ProfilePage is defined elsewhere
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Colors.black,
        waterDropColor: Colors.amber, // Active item color
        onItemSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
        barItems: <BarItem>[
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,

          ),
          BarItem(
            filledIcon: Icons.fastfood,
            outlinedIcon: Icons.fastfood_outlined,

          ),
          BarItem(
            filledIcon: Icons.shopping_cart,
            outlinedIcon: Icons.shopping_cart_outlined,

          ),
          BarItem(
            filledIcon: Icons.person,
            outlinedIcon: Icons.person_outline,

          ),
        ],
      ),
    );
  }
}

class GrabNGoPage extends StatelessWidget {
  const GrabNGoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Grab & Go Page"));
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Page"));
  }
}

