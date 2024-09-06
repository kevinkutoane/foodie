import 'package:flutter/material.dart';
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
      home: HomePage(),
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