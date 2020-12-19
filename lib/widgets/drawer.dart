import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/provider/profile_provider.dart';
import 'package:shop_app2/screen/category.dart';
import 'package:shop_app2/screen/ordered_screen.dart';
import '../screen/profile.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // elevation: 150,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              ),
            ),
            padding: EdgeInsets.only(top: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Consumer<ProfilePhoto>(
                  builder: (ctx, value, _) => Container(
                    child: CircleAvatar(
                      backgroundImage: value.photo != null
                          ? FileImage(value.photo)
                          : NetworkImage(
                              'https://mpng.subpng.com/20180402/uaw/kisspng-decision-making-computer-icons-information-manager-5ac2eeb55814f4.7738334015227245333608.jpg',
                            ),
                    ),
                    margin: EdgeInsets.only(right: 180),
                    height: 100,
                  ),
                ),
                Consumer<ProfilePhoto>(
                  builder: (ctx, value, _) => ListTile(
                    title: Text(
                      value.title != null ? value.title : 'USERNAME',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(Profile.routeName);
                    },
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
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(Category.routeName);
            },
            onLongPress: () {
              Navigator.of(context).pop();
            },
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
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
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
            onTap: () {
              Navigator.of(context).pop();
            },
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
          ),
          RaisedButton.icon(
            color: Colors.blueAccent,
            icon: Icon(Icons.logout),
            label: Text('Logout'),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
          Center(
            child: Text(
              'All right reseved! 0.0',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
