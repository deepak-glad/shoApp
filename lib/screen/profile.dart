import 'package:flutter/material.dart';
import 'orders.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Stack(
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
              Container(
                child: CircleAvatar(
                  radius: 50,
                ),
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.only(top: 150),
              ),
              Container(
                child: Text('userName'),
                margin: EdgeInsets.only(top: 230, left: 150),
                // padding: EdgeInsets.only(top: 200, left: 15),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Orders'),
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.open_with_rounded),
            subtitle: Text('Check your order status'),
            onTap: () {
              Navigator.of(context).pushNamed(Orders.routeNamed);
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
            title: Text(
              '             FAQs',
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
            title: Text('             CANTACT US',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              '             MORE',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            onTap: () {},
          ),
          FlatButton(
            child: Text('LOGOUT'),
            onPressed: () {},
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
