import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(new CameraApp());
}

class CameraApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return new CameraState();
  }
}

class CameraState extends State<CameraApp> {
  File image;
  picker() async {
    print('Picker is called');
    //image = await ImagePicker.pickImage(source: ImageSource.gallery); // access photos from gallery
    image = await ImagePicker.pickImage(source: ImageSource.camera); // take photos with the camera

    if (image != null) {
      print(image.path);
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('Image Picker'),
        ),
        body: new Container(
          child: new Row(
            children: <Widget>[
              image == null?new Text('No Image to Show'):new Image.file(image),
              new Text("render !! " + DateTime.now().toString()),
            ],

          )
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: picker, child: new Icon(Icons.camera_alt)),
      ),
    );
  }
}
