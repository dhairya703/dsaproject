import 'package:firestore/user/sendrequest.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class property extends StatefulWidget {
  @override
  _propertyState createState() => _propertyState();
}

enum FilterOption {
  All,
  PropertyProducts,
  DocumentReview,
  

}

class _propertyState extends State<property> {
  CollectionReference documentation = FirebaseFirestore.instance.collection('documentation');
  FilterOption selectedFilter = FilterOption.All;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Lawyers"),
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
                  ? documentation.snapshots()
                  : documentation
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
                        margin: EdgeInsets.all(10),
                        elevation: 4,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(data['topic'] ?? ''),
                              // subtitle: Text(data['legalissue'] ?? ''),
                              leading: SizedBox(
                                width: 80, // Set the width of the leading widget
                                height: 80, // Set the height of the leading widget
                                child: Align(
                                  alignment: Alignment.center, // Align the image to the center
                                  child: data['images'] != null
                                      ? Image.network(
                                    data['images'],
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.network(
                                          'images'); // Replace with your placeholder image
                                    },
                                  )
                                      : Image.asset(
                                    'Image not available',
                                  ), // Display a placeholder if 'image_url' is missing
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
                radius: 80, // Adjust the size as needed
                backgroundImage: NetworkImage(data['images'] ?? ''), // Use the image URL if available
                backgroundColor: Colors.grey, // Use a placeholder background color
              ),
              SizedBox(height: 16), // Add spacing between image and name
              Text(data['topic'] ?? ''),
              SizedBox(height: 8), // Add spacing between name and description
              Text(data['description'] ?? ''),
              SizedBox(height: 20), // Add spacing between text and buttons
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