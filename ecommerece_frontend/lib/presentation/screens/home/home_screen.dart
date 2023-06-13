import 'package:ecommerece_frontend/presentation/screens/home/category_screen.dart';
import 'package:ecommerece_frontend/presentation/screens/home/profile_screen.dart';
import 'package:ecommerece_frontend/presentation/screens/home/user_feed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> page = const [
    UserFeedScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.cart_fill),
          ),
        ],
      ),
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (Index) {
          setState(() {
            currentIndex = Index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
