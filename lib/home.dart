import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File ? _selectedImage;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: ElevatedButton(
              onPressed: (){
              _pickImageFromGalary();
            },
                child: Text(
                  'Pick Image From Gallary',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: ElevatedButton(
              onPressed: (){
                _pickImageFromCamera();
              },
              child: Text(
                'Capture Image From Camera',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: _selectedImage != null ? Image.file(_selectedImage!) : Text('Please select an Image'),
          ),
        ],
      ),
    );
  }

  Future _pickImageFromGalary() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImage == null)return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _pickImageFromCamera() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnedImage == null)return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }


}