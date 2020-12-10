import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final cities = [
    'ff',
    'vv',
    'cc',
    'yam',
    'banda',
    'Hamirpur',
  ];
  final recentCity = [
    'kanpur',
    'delhi',
    'mumbai',
  ];
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
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCity
        : cities.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {},
        leading: Icon(Icons.location_city),
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
