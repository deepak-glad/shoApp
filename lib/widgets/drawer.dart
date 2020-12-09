import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(bottom: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'UserName',
                    // textAlign: TextAlign.values,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Shop by Categories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {},
            leading: Icon(Icons.category),
          ),
          Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'Theme Store',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(Icons.store),
            onTap: () {},
          ),
          Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'Orders',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(Icons.online_prediction_rounded),
            onTap: () {},
          ),
          Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: Text(
              'FAQs',
              style: TextStyle(fontWeight: FontWeight.w400),
              textAlign: TextAlign.start,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'FAQs',
              style: TextStyle(fontWeight: FontWeight.w400),
              textAlign: TextAlign.start,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('CANTACT US',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w400)),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'MORE',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
