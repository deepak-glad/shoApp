import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/provider/Product_provider.dart';

import '../screen/product_detail.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
    // throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.of(context).pop();
        // close(context, null);
      },
    );
    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final conatainTitle = Provider.of<ProductProvider>(context);
    final data = conatainTitle.items;
    final recent = [
      data[0].title,
      data[1].title,
      data[2].title,
    ];
    final title = [
      data[0].title,
      data[1].title,
      data[2].title,
      data[3].title,
    ];

    final suggestionList = query.isEmpty
        ? recent
        : title.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          // showResults(context);
          Navigator.of(context).pushNamed(
            ProductDetail.routeName,
            arguments: data[index].id,
          );
        },
        leading: Icon(Icons.receipt_rounded),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    )),
              ]),
        ),
      ),
    );
  }
}
