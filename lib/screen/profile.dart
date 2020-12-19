import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/provider/profile_provider.dart';
import '../screen/personalInformation.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile-screen';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Profile',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Personal.routeName);
            },
            child: Stack(
              children: [
                Container(
                  // child: CircleAvatar(),
                  height: 200,
                  width: double.infinity,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.topLeft,
                          colors: [Colors.pink[100], Colors.red[300]])),
                ),
                // if (Error != null)
                Consumer<ProfilePhoto>(
                  builder: (ctx, value, _) => Container(
                    // color: Colors.grey,
                    child: CircleAvatar(
                      backgroundImage: value.photo != null
                          ? FileImage(value.photo)
                          : AssetImage('assets/profile/dummyprofile.jpg'),
                      radius: 90,
                    ),
                    margin: EdgeInsets.only(
                        top: deviceSize.size.height / 4 - 30, left: 20),
                    // padding: EdgeInsets.only(top: 9),
                  ),
                ),
                if (Error != null)
                  Consumer<ProfilePhoto>(
                    builder: (ctx, value, _) => Container(
                      // color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              value.title != null ? value.title : 'USERNAME',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Personal.routeName);
                            },
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 240, left: 200),
                      // padding: EdgeInsets.only(top: 200, left: 15),
                    ),
                  ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Orders'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.open_with_rounded),
            subtitle: Text('Check your order status'),
            onTap: () {
              // Navigator.of(context).pushNamed(Orders.routeName);
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
          Divider(),
          ListTile(
            title: Text('Help Center'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.headset),
            subtitle: Text('Help Regarding Query'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Whishlist'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.favorite_border_outlined),
            subtitle: Text('Your order love'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Refer & Earn'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.refresh_sharp),
            subtitle: Text('Invite friends and Earn'),
            onTap: () {},
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text('Saved Card'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.save),
            subtitle: Text('Saved Cards for future order'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Address'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.location_city),
            subtitle: Text('Address for your Order'),
            onTap: () {},
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text('Setting'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.settings),
            subtitle: Text('Manage Notification for setting'),
            onTap: () {},
          ),
          Divider(),
          Divider(),
          ListTile(
            leading: Icon(Icons.query_builder),
            title: Text(
              'FAQs',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              textAlign: TextAlign.start,
            ),
            onTap: () {
              // Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('CANTACT US',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.more),
            title: Text(
              'MORE',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            onTap: () {},
          ),
          FlatButton.icon(
            icon: Icon(Icons.logout),
            label: Text('LOGOUT'),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.red,
          ),
          Divider(),
          Center(
            child: Text('APP VERSION 4.2011.2'),
            // margin: EdgeInsets.all(15),
            heightFactor: 10,
          )
        ]),
      ),
    );
  }
}
