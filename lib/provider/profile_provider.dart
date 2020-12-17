import 'dart:io';

import 'package:flutter/material.dart';

class Profil {
  final String title;
  File imag;

  Profil(
    this.title,
    this.imag,
  );
}

class ProfilePhoto with ChangeNotifier {
  List<Profil> _items = [];
  String title;
  File photo;

  List<Profil> get items {
    return [..._items];
  }

  void addItems(String pickedtitle, File pickedImage) {
    final newData = Profil(pickedtitle, pickedImage);
    // pickedImage = photo;
    // pickedtitle = title;
    // print(newData.title);
    // print(newData.imag);
    photo = newData.imag;
    title = newData.title;
    print(photo);
    print(title);
    _items.add(newData);
    notifyListeners();
  }
}
