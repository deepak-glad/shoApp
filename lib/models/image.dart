import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:rflutter_alert/rflutter_alert.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagepickFn);
  final Function imagepickFn;
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  void _pickGallery() async {
    final pickImageGallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 150,
      maxWidth: 150,
    );
    setState(() {
      _pickedImage = pickImageGallery;
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(pickImageGallery.path);
    final saveImage = await pickImageGallery.copy('${appDir.path}/$filename');
    widget.imagepickFn(saveImage);
    Navigator.of(context).pop();
  }

  void _alert() {
    Alert(
        context: context,
        title: 'Select Purpose',
        type: AlertType.info,
        buttons: [
          // if (_pickedImage == null)
          DialogButton(
            child: Text(
              "camera",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: _pickImage,
          ),
          // if (_pickGallery == null)
          DialogButton(
            child: Text(
              "gallery",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: _pickGallery,
          ),
        ]).show();
  }

  void _pickImage() async {
    final pickImageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 150,
      maxWidth: 600,
    );
    setState(() {
      _pickedImage = pickImageFile;
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(pickImageFile.path);
    final saveImage = await pickImageFile.copy('${appDir.path}/$filename');
    widget.imagepickFn(saveImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          GestureDetector(
            onTap: _alert,
            child: CircleAvatar(
              // backgroundColor: Theme.of(context).canvasColor,
              radius: 75,
              backgroundImage: _pickedImage != null
                  ? FileImage(_pickedImage)
                  : NetworkImage(
                      'https://mpng.subpng.com/20180402/uaw/kisspng-decision-making-computer-icons-information-manager-5ac2eeb55814f4.7738334015227245333608.jpg',
                    ),
            ),
          ),
          IconButton(
            // alignment: Alignment.center,
            icon: Icon(Icons.edit),
            onPressed: _alert,
          ),
        ]),
      ],
    );
  }
}
