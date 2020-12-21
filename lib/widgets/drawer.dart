import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
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
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> _isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return isAvailable;

    isAvailable
        ? print('Biometric is available')
        : print('Biometric is not available');
    return isAvailable;
  }

  Future<void> _getBiometricTypes() async {
    List<BiometricType> listofBiometric;
    try {
      listofBiometric = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    print(listofBiometric);
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason:
            "Please authenticate to view your transaction overview",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    isAuthenticated
        ? print('User is authenticated!')
        : print('User is not authenticated.');

    if (isAuthenticated) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OrderScreen(),
        ),
      );
    }
  }

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
                          : AssetImage('assets/profile/dummyprofile.jpg'),
                    ),
                    margin: EdgeInsets.only(right: 180),
                    height: 100,
                  ),
                ),
                Consumer<ProfilePhoto>(
                  builder: (ctx, value, _) => ListTile(
                    title: Text(
                      value.title != null ? value.title : 'USERNAME',
                      overflow: TextOverflow.ellipsis,
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
              onTap: () async {
                if (await _isBiometricAvailable()) {
                  await _getBiometricTypes();
                  await _authenticateUser();
                }
                // Navigator.of(context).pop();
                // Navigator.of(context).pushNamed(OrderScreen.routeName);
              }),
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
            // color: Colors.blueAccent[350],
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
