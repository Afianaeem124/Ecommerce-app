import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/profile.dart';

import 'categories.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({Key? key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int myindex = 0;
  final PageController _pageController = PageController();

  static List<Widget> wlist = [
    Home(),
    category(),
    Home(),
    Home(),
    Myprofile(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            myindex = index;
            _pageController
                .jumpToPage(index); // Scroll the PageView to the selected index
          });
        },
        currentIndex: myindex,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Bag',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            myindex =
                index; // Update the current index when PageView is scrolled
          });
        },
        children: wlist,
      ),
    );
  }
}
