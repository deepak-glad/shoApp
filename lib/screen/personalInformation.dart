import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  static const routeName = '/personal-information';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
    );
  }
}
