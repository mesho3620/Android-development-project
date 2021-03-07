import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    //A Future is used to represent a potential value, or error, that will be available at some time in the future
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('image path$_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      //using path package because i only need pic name only not entire path
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      //check if its completed or not
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("picture has been updated successfuly");
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('picture has been updated successfuly')));
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Edit Profile'),
      ),
      body: Builder(
          builder: (context) => Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.orangeAccent,
                            child: ClipOval(
                              child: SizedBox(
                                width: 180.0,
                                height: 180.0,
                                //check if image exest or no
                                child: (_image != null)
                                    ? Image.file(
                                        _image,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 60.0),
                          child: IconButton(
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.orangeAccent,
                                size: 38.0,
                              ),
                              onPressed: () {
                                getImage();
                              }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('UserName',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Adham Hamzawy',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 18.0)),
                              ),
                            ],
                          )),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Icon(Icons.edit_outlined),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Email',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('ANDROID@gmail.com',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 18.0)),
                              ),
                            ],
                          )),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Icon(Icons.email),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.orangeAccent,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          child: Text(
                            'Cancel',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                        RaisedButton(
                          color: Colors.orangeAccent,
                          onPressed: () {
                            uploadPic(context);
                          },
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          child: Text(
                            'Submit',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
