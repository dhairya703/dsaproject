import 'package:firestore/user/chatpage.dart';
import 'package:firestore/user/sendrequest.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Hourly extends StatefulWidget {
  @override
  _HourlyState createState() => _HourlyState();
}

enum FilterOption {
  All,
  CriminalDefense,
  Civil,
  Corporate,
  PublicInterest,
  Immigration,
  IntellectualProperty
}

class _HourlyState extends State<Hourly> {
  CollectionReference hourly = FirebaseFirestore.instance.collection('hourly');
  FilterOption selectedFilter = FilterOption.All;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Pending"),
      ),
      body: Column(
        children: [
          DropdownButton<FilterOption>(
            // Dropdown button for selecting a filter
            value: selectedFilter,
            onChanged: (newValue) {
              setState(() {
                selectedFilter = newValue!;
              });
            },
            items: FilterOption.values.map((option) {
              return DropdownMenuItem<FilterOption>(
                value: option,
                child: Text(option.toString().split('.').last),
              );
            }).toList(),
          ),

          Expanded(
            child: StreamBuilder(
              stream: selectedFilter == FilterOption.All
                  ? hourly.snapshots()
                  : hourly
                  .where('filter', isEqualTo: selectedFilter.toString().split('.').last)
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
                        color: Colors.blue,
                        child:
                        Column(
                            children:[ ListTile(
                              title: Text(data['name'] ?? ''),
                              // subtitle: Text(data['legalissue'] ?? ''),
                              // leading: data['images'] != null
                              //     ? Image.network(
                              //   data['images'],
                              //   errorBuilder: (context, error, stackTrace) {
                              //     return Image.network(
                              //         'images'); // Replace with your placeholder image
                              //   },
                              // )
                              //     : Image.asset(
                              //     'Image not available'), // Display a placeholder if 'image_url' is missing

                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('LegalIssue: ${data['legalissue'] ?? ''}'),
                                  Text('Phone: ${data['phone'] ?? ''}'),
                                  Text('Address: ${data['address'] ?? ''}'),
                                  Text('Duration in Hours: ${data['duration'] ?? ''}'),
                                  Text('Date: ${data['date'] ?? ''}'),
                                ],
                              ),
                            ),


                            ] ),

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
                radius: 80, // Adjust the size as needed
                backgroundImage: NetworkImage(data['images'] ?? ''), // Use the image URL if available
                backgroundColor: Colors.grey, // Use a placeholder background color
              ),
              SizedBox(height: 16), // Add spacing between image and name
              Text(
                data['name'] ?? '',
                style: TextStyle(
                  fontSize: 18, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Add spacing between name and description
              Text(data['legalissue'] ?? ''),
              Text(data['address'] ?? ''),
              Text(data['phone'] ?? ''),
              SizedBox(height: 20), // Add spacing between text and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage()),
                      );
                    },
                    child: Text('Approve'),
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