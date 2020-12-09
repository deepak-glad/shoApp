import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  void _switching(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      onTap: _switching,
      elevation: 55,
      unselectedFontSize: 50,
      // fixedColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).primaryColor,
    );
  }
}
