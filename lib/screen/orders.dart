import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  static const routeNamed = '/orders-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Colors.white,
      ),
    );
  }
}
