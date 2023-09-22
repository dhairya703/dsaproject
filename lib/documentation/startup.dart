import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/user/sendrequest.dart';
import 'package:flutter/material.dart';
class startup extends StatefulWidget {
  @override
  _startupState createState() => _startupState();
}

enum FilterOption {
  Startup,
}

class _startupState extends State<startup> {
  CollectionReference documentation =
  FirebaseFirestore.instance.collection('documentation');
  FilterOption selectedFilter = FilterOption.Startup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Lawyers"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: documentation
                  .where('filter', isEqualTo: 'Startup') // Filter by 'Startup'
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
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(data['topic'] ?? ''),
                              leading: SizedBox(
                                width: 80,
                                height: 80,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: data['images'] != null
                                      ? Image.network(
                                    data['images'],
                                    errorBuilder: (context, error,
                                        stackTrace) {
                                      return Image.network(
                                          'images');
                                    },
                                  )
                                      : Image.asset(
                                    'Image not available',
                                  ),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Rating: ${data['rating'] ?? ''} 🌟'),
                                      Text('(${data['reviews'] ?? ''})'),
                                    ],
                                  ),
                                  Text('${data['purchases'] ?? ''}'),
                                  Text('Cost: Rs ${data['price'] ?? ''}'),
                                ],
                              ),
                            ),
                          ],
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
          contentPadding: EdgeInsets.all(16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(data['images'] ?? ''),
                backgroundColor: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(data['topic'] ?? ''),
              SizedBox(height: 8),
              Text(data['description'] ?? ''),
              SizedBox(height: 20),
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
                    child: Text('Buy Now'),
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
