import 'package:flutter/material.dart';
import 'package:icb/Screen/HomeScreen.dart';
import 'package:icb/pages/cart.dart';
import 'package:icb/pages/massage.dart';
import 'package:icb/pages/profile.dart';
import 'package:icb/pages/wishlist.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _NavigationPagesList = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const Massage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_NavigationPagesList[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
        selectedLabelStyle: const TextStyle(color: Colors.black),
        fixedColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "WishCart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sms),
            label: "Massage",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
