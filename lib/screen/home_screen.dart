import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/drawer.dart';
import '../widgets/bottom_navigation.dart';

class ShopApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Myntra',
                // textAlign: TextAlign.start,
                style: TextStyle(color: Colors.red),
              ),
              IconButton(
                // padding: EdgeInsets.only(left: 180),
                icon: Icon(Icons.favorite),
                onPressed: () {},
                color: Theme.of(context).accentColor,
                // alignment: Alignment.center,
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
                color: Theme.of(context).accentColor,
              ),
              IconButton(
                icon: Icon(Icons.card_travel),
                color: Theme.of(context).accentColor,
                onPressed: () {},
              )
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(child: Text('hi...')),
        bottomNavigationBar: BottomNavigation());
  }
}
