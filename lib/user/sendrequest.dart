import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/filter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class sendrequest extends StatefulWidget {
  @override
  _sendrequestState createState() => _sendrequestState();
}

class _sendrequestState extends State<sendrequest> {
  CollectionReference request = FirebaseFirestore.instance.collection('request');
  late String name;
  late String contactnumber;
  late String address;
  late String description;
  late String imageUrl;
  FilterOption selectedFilter =
      FilterOption.CriminalDefense; // Initialize with a default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Data"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(hintText: 'Enter your Name'),
                ),
                TextField(
                  onChanged: (value) {
                    contactnumber = value;
                  },
                  decoration: InputDecoration(hintText: 'Enter contactnumber'),
                ),
                TextField(
                  onChanged: (value) {
                    address = value;
                  },
                  decoration: InputDecoration(hintText: 'Enter address'),
                ),
                TextField(
                  onChanged: (value) {
                    description = value;
                  },
                  decoration: InputDecoration(hintText: 'Enter Case Description'),
                ),
Text("Select Your AadharImage"),
                IconButton(
                    onPressed: () async {
                      ImagePicker imagepicker = ImagePicker();
                      XFile? file = await imagepicker.pickImage(
                          source: ImageSource.gallery);
                      if(file==null)return;
                      print('{$file.path}');
                      String uniqueFilename=DateTime.now().millisecondsSinceEpoch.toString();
                      Reference referenceRoot=FirebaseStorage.instance.ref();
                      Reference referenceDirImages=referenceRoot.child('images');
                      Reference referencetoUpload=referenceDirImages.child(uniqueFilename);
                      try{
                        await referencetoUpload.putFile(File(file!.path));
                        imageUrl=await referencetoUpload.getDownloadURL();

                      }catch(error){}
                    },
                    icon: Icon(Icons.camera_alt))
              ],
            ),
          ),
          // DropdownButton<FilterOption>(
          //   // Dropdown button for selecting a filter
          //   value: selectedFilter,
          //   onChanged: (newValue) {
          //     setState(() {
          //       selectedFilter = newValue!;
          //     });
          //   },
          //   items: FilterOption.values.map((option) {
          //     return DropdownMenuItem<FilterOption>(
          //       value: option,
          //       child: Text(option
          //           .toString()
          //           .split('.')
          //           .last), // Remove "FilterOption."
          //     );
          //   }).toList(),
          // ),
          ElevatedButton(
            onPressed: () async {
              // Convert the enum value to a string
              String filterString = selectedFilter.toString().split('.').last;
              if(imageUrl.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pls Upload a image")));
              }
              // Check if a filter is selected before adding data
              if (filterString.isNotEmpty) {
                await request.add({
                  'name': name,
                  'contactnumber': contactnumber,
                  'address': address,
                  'description': description,
                  // 'filter': filterString,
                  'images':imageUrl,// Save the selected filter
                }).then((value) => print("User added"));
              } else {
                print("Please select a filter before submitting.");
              }
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
