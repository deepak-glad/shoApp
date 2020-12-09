import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.black,
        primarySwatch: Colors.amber,
        errorColor: Colors.red,
        brightness: Brightness.light,
        primaryColor: Colors.cyan,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple)),
        // iconTheme: ThemeData.from(icons)
      ),
      home: ShopApp2(),
    );
  }
}
