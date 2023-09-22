import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadDataPage extends StatefulWidget {
  @override
  _UploadDataPageState createState() => _UploadDataPageState();
}

class _UploadDataPageState extends State<UploadDataPage> {
  // Controllers for input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController legalIssueController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  late String imageUrl;
  // Firestore collection reference
  CollectionReference hourly = FirebaseFirestore.instance.collection('hourly');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xfff5f5dc),
      appBar: AppBar(
        backgroundColor: Color(0xff660033)
        , iconTheme: IconThemeData(color: Colors.white),
        title: Text('Nyay Bandhu',style: TextStyle(color: Colors.white),),
      ),


      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: legalIssueController,
              decoration: InputDecoration(labelText: 'Legal Issue'),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextFormField(
              controller: durationController,
              decoration: InputDecoration(labelText: 'Duration in Hours'),
            ),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                uploadData();
              },
              child: Text('Upload Data',style: TextStyle(color: Colors.white),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff660033)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void uploadData() {
    final String name = nameController.text;
    final String legalIssue = legalIssueController.text;
    final String address = addressController.text;
    final String phone = phoneController.text;
    final String duration = durationController.text;
    final String date = dateController.text;

    if (name.isNotEmpty &&
        legalIssue.isNotEmpty &&
        address.isNotEmpty &&
        phone.isNotEmpty &&
        duration.isNotEmpty &&
        date.isNotEmpty) {
      hourly.add({
        'name': name,
        'legalissue': legalIssue,
        'address': address,
        'phone': phone,
        'duration': duration,
        'date': date,
      }).then((value) {
        // Data uploaded successfully
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data uploaded successfully.'),
          ),
        );

        // Clear the input fields
        nameController.clear();
        legalIssueController.clear();
        addressController.clear();
        phoneController.clear();
        durationController.clear();
        dateController.clear();
      }).catchError((error) {
        // Handle error if data upload fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error uploading data: $error'),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is removed from the tree
    nameController.dispose();
    legalIssueController.dispose();
    addressController.dispose();
    phoneController.dispose();
    durationController.dispose();
    dateController.dispose();
    super.dispose();
  }
}
