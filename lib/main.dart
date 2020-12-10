import 'package:flutter/material.dart';
import 'package:shop_app2/screen/orders.dart';
import 'package:shop_app2/screen/product_detail.dart';
import 'package:shop_app2/screen/profile.dart';
import 'screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'provider/Product_provider.dart';
import 'screen/category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Colors.black,
          primarySwatch: Colors.amber,
          errorColor: Colors.red,
          brightness: Brightness.light,
          primaryColor: Colors.grey,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
          // iconTheme: ThemeData.from(icons)
        ),
        home: ShopApp2(),
        routes: {
          ProductDetail.routeName: (ctx) => ProductDetail(),
          Category.routeName: (ctx) => Category(),
          Orders.routeNamed: (ctx) => Orders(),
          Profile.routeName: (ctx) => Profile(),
          // Favorite.routeName: (ctx) => Favorite(),
        },
      ),
    );
  }
}
