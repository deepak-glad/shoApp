import 'package:flutter/material.dart';
import 'package:shop_app2/provider/cart.dart';
import 'package:shop_app2/provider/profile_provider.dart';
import 'package:shop_app2/screen/ordered_screen.dart';

import 'package:shop_app2/screen/personalInformation.dart';
import 'package:shop_app2/screen/product_detail.dart';
import 'package:shop_app2/screen/profile.dart';
import 'screen/cart_screen.dart';
import 'screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'provider/Product_provider.dart';
import 'screen/category.dart';
import 'provider/order_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
        ChangeNotifierProvider(create: (ctx) => ProfilePhoto()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          disabledColor: Colors.grey,
          shadowColor: Color.fromRGBO(252, 224, 146, 0.9),
          canvasColor: Colors.white,
          accentColor: Colors.black,
          primarySwatch: Colors.amber,
          errorColor: Colors.red,
          brightness: Brightness.light,
          primaryColor: Colors.black,
          // textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
          iconTheme:
              Theme.of(context).primaryIconTheme.copyWith(color: Colors.red),
        ),
        home: ShopApp2(),
        routes: {
          ProductDetail.routeName: (ctx) => ProductDetail(),
          Category.routeName: (ctx) => Category(),
          Order.routeName: (ctx) => Order(),
          Profile.routeName: (ctx) => Profile(),
          Personal.routeName: (ctx) => Personal(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          // SlidupPanel.routeName: (ctx) => SlidupPanel(),
          // Favorite.routeName: (ctx) => Favorite(),
        },
      ),
    );
  }
}
