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
      body: Column(children: [
        Stack(
          children: [
            Image.network(
              'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2017/03/AK-Haines-landscape-evening-012117-47.jpg?resize=750%2C186&ssl=1',
              // height: 100,
              // width: 100,
              fit: BoxFit.fill,
              height: 100,
            ),
            ListTile(
              title: Text(
                'Mens',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
              contentPadding: EdgeInsets.only(right: 320, top: 20),
              trailing: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
          ],
        ),
        ListTile(
          title: Text('Women'),

          // trailing: Icon(Icons.arrow_forward),
          // leading: Icon(Icons.open_with_rounded),
          subtitle: Text('Clothes for women'),
          onTap: () {
            // Navigator.of(context).pushNamed(Orders.routeNamed);
          },
          // tileColor: Theme.of(context).primaryColor,
        ),
        Divider(),
        ListTile(
          title: Text('Myntra Inside'),
          trailing: Icon(Icons.arrow_forward),
          leading: Icon(Icons.add_business),
          subtitle: Text('Perks,Privileges,Pride'),
          onTap: () {},
        ),
      ]),
    );
  }
}
