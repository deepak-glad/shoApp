import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  static const routeName = '/category-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        backgroundColor: Colors.white,
      ),
    );
  }
}
