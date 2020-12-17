import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagepickFn);
  final Function imagepickFn;
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
        maxWidth: 600);
    setState(() {
      _pickedImage = pickImageFile;
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(pickImageFile.path);
    final saveImage = await pickImageFile.copy('${appDir.path}/$filename');
    widget.imagepickFn(saveImage);
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
