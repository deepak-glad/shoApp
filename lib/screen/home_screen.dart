import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_app2/screen/category.dart';
import 'package:shop_app2/screen/orders.dart';
import 'package:shop_app2/screen/profile.dart';
import '../widgets/home.dart';

class ShopApp2 extends StatefulWidget {
  @override
  _ShopApp2State createState() => _ShopApp2State();
}

enum FilterOption {
  All,
  Only,
}

class _ShopApp2State extends State<ShopApp2> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    Home(),
    Category(),
    Orders(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // mouseCursor: SystemMouseCursors.text,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          // color: Theme.of(context).accentColor,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Theme.of(context).accentColor),
            label: 'Home',
            // backgroundColor: Colors.grey[500],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: Theme.of(context).accentColor,
            ),
            label: 'category',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
              color: Theme.of(context).accentColor,
            ),
            label: 'studio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Theme.of(context).accentColor,
            ),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink,
        iconSize: 30,
        onTap: onTabTapped,
        elevation: 55,
        // unselectedFontSize: 50,
        showUnselectedLabels: true,
        // fixedColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
