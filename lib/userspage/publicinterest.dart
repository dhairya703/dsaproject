import 'package:firestore/user/sendrequest.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class public extends StatefulWidget {
  const public({Key? key}) : super(key: key);
  @override
  _publicState createState() => _publicState();
}

enum FilterOption {
  All,
  CriminalDefense,
  Civil,
  Corporate,
  PublicInterest,
  Immigration,
  IntellectualProperty,
}

class _publicState extends State<public> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FilterOption selectedFilter = FilterOption
      .PublicInterest; // Set the initial filter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PublicInterest Lawyers"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: selectedFilter == FilterOption.All
                  ? users.snapshots()
                  : users
                  .where('filter', isEqualTo: 'PublicInterest')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var data = documents[index].data() as Map<String, dynamic>;

                    return GestureDetector(
                      onTap: () {
                        // Handle the click event here, e.g., navigate to a new page or show a dialog
                        _showDetailsDialog(data);
                      },
                      child: Card(
                        margin: EdgeInsets.all(10),
                        elevation: 4,
                        child: ListTile(
                          title: Text(data['name'] ?? ''),
                          subtitle: Text(data['description'] ?? ''),
                          leading: data['images'] != null
                              ? Image.network(
                            data['images'],
                            errorBuilder:
                                (context, error, stackTrace) {
                              return Image.network(
                                  'images'); // Replace with your placeholder image
                            },
                          )
                              : Image.asset(
                              'Image not available'), // Display a placeholder if 'image_url' is missing
                          // Add more card content here based on your data
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailsDialog(Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(data['name'] ?? ''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(data['description'] ?? ''),
              SizedBox(height: 20), // Add some spacing between text and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sendrequest()),
                      );
                    },
                    child: Text('Request'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}