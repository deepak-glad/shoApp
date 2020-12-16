import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagepickFn);
  final void Function(File pickedImage) imagepickFn;
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  void _pickImage() async {
    // ignore: deprecated_member_use
    final pickImageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 150,
    );
    setState(() {
      _pickedImage = pickImageFile;
    });
    widget.imagepickFn(pickImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(right: 200),
          title: CircleAvatar(
            // backgroundColor: Theme.of(context).errorColor,
            radius: 75,
            backgroundImage:
                _pickedImage != null ? FileImage(_pickedImage) : null,
          ),
        ),
        if (_pickedImage == null)
          FlatButton.icon(
            padding: EdgeInsets.all(50),
            icon: Icon(Icons.imagesearch_roller),
            onPressed: _pickImage,
            label: Text(''),
          ),
      ],
    );
  }
}
