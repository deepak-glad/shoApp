import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/Product_provider.dart';
import 'package:shop_app2/models/product_items.dart';

class ProductOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final productss = productData.items;
    return GridView.builder(
      itemCount: productss.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: productss[i],
          // create: (c) => productss[i],
          child: ProductItem()),
      // productss[i].id,
      // productss[i].title,
      // productss[i].imageUrl,
      // productss[i].description,
      // productss[i].isFavorite,
      // ),
      // ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
        crossAxisSpacing: 1,
      ),
    );
  }
}
