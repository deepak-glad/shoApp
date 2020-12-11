import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/provider/Product_provider.dart';

import 'package:shop_app2/screen/orders.dart';
import 'package:shop_app2/widgets/drawer.dart';
import 'package:shop_app2/widgets/product_overView.dart';
import '../models/search.dart';

enum FilterOption {
  All,
  Only,
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final containerFav = Provider.of<ProductProvider>(context, listen: false);

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
            Row(
              children: [
                PopupMenuButton(
                  onSelected: (FilterOption selectedValue) {
                    if (selectedValue == FilterOption.Only) {
                      containerFav.favoritesOnly();
                    } else {
                      containerFav.showAll();
                    }
                    // print(selectedValue);
                  },
                  icon: Icon(
                    Icons.favorite,
                    // color: Colors.red,
                  ),
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Fav'),
                      value: FilterOption.Only,
                    ),
                    PopupMenuItem(
                      value: FilterOption.All,
                      child: Text('All'),
                    )
                  ],
                ),
                // IconButton(
                //   icon: Icon(Icons.favorite),
                //   onPressed: () {
                //     Navigator.of(context).pushNamed(Favorite.routeName);
                //   },
                //   color: Theme.of(context).accentColor,
                // ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  color: Theme.of(context).accentColor,
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.of(context).pushNamed(Orders.routeNamed);
                  },
                )
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: ProductOverview(),
    );
  }
}
