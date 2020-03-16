
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:image_picker/image_picker.dart';

class NewPostScreen extends StatefulWidget{

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {

  File image;

  LocationData locationData;
  DateTime date;
  String imageURL;
  int quantity;
  double latitude;
  double longitude;

  final formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    getLocationAndImage();
  }

  @override
  Widget build(BuildContext context){
    if (locationData == null || image == null){
      return Scaffold(
        appBar: AppBar(title: Text('Wasteagram'),),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    else{
      return Scaffold(
        appBar: AppBar(title: Text('Wasteagram'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 120, width: 120, child: Image.file(image),),
              SizedBox(height: 10),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: '# of Items', border: OutlineInputBorder()),
                      onSaved: (value){quantity = int.parse(value);},
                      validator: (value){if(value.isEmpty){return 'Please enter number';}else{return null;}},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Semantics(
                child: RaisedButton(child: Icon(Icons.cloud_upload), onPressed: () { uploadPost(); Navigator.pop(context); },),
                button: true,
                enabled: true,
                onTapHint: 'upload new post',
              ),
            ],
          ),
        ),
      );
    }
    
  }

  getLocationAndImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);

    var locationService = Location();
    locationData = await locationService.getLocation();
    latitude = locationData.latitude;
    longitude = locationData.longitude;

    setState( () {} );
  }

  uploadPost() async {
    if(formKey.currentState.validate()){
      formKey.currentState.save();

      StorageReference storageReference =  FirebaseStorage.instance.ref().child(  'item' + DateTime.now().toString() + '.jpg');
      StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      imageURL = await storageReference.getDownloadURL();
      
      Firestore.instance.collection('posts').add({
      'date': DateTime.now(),
      'quantity': quantity,
      'imageURL': imageURL,
      'latitude': latitude,
      'longitude': longitude,
    });
    }
  }  

}