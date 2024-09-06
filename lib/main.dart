import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';

import 'package:foodie/widgets/bottom_navbar.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: FloatingNavBar(
        resizeToAvoidBottomInset: true,
        color: Colors.amber,
        items: [
          FloatingNavBarItem(
            iconData: Icons.home,
            title: 'Home',
            page: const HomePage(),
          ),
          FloatingNavBarItem(
            iconData: Icons.account_circle,
            title: 'GrabnGo',
            page: const GrabNGoPage(),
          ),
          FloatingNavBarItem(
            iconData: Icons.shopping_cart,
            title: 'Cart',
            page: const ViewCartPage(),
          ),
          FloatingNavBarItem(
            iconData: Icons.person,
            title: 'Profile',
            page: const ProfilePage(),
          ),
        ],
        selectedIconColor: Colors.black,
        hapticFeedback: true,
        horizontalPadding: 30,
      ),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      primaryColor: Colors.black,
      hintColor: Colors.amber,
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.amber),
        titleTextStyle: TextStyle(color: Colors.amber, fontSize: 20),
      ),
    );
  }
}
