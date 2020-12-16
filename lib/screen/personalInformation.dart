import 'package:flutter/material.dart';
import '../models/image.dart';
import 'dart:io';

class Personal extends StatefulWidget {
  static const routeName = '/personal-information';

  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      body: Column(
        children: [
          Container(
            // color: Theme.of(context).primaryColor,
            child: UserImagePicker(_pickedImage),
            margin: EdgeInsets.only(right: 100),
            height: 100,
          ),
          ListTile(
            // tileColor: Theme.of(context).primaryColor,
            hoverColor: Theme.of(context).primaryColor,
            subtitle: Text('username should be unique'),
            leading: Text(
              'USERNAME:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            title: TextField(
              onTap: () {},
              decoration: InputDecoration(
                  alignLabelWithHint: true, hintText: 'USERNAME'),
              autocorrect: true,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.sentences,
            ),
          )
        ],
      ),
    );
  }
}
