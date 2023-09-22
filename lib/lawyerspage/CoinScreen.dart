import 'package:firestore/user/sendrequest.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IncentivePortal extends StatefulWidget {
  const IncentivePortal({Key? key}) : super(key: key);

  @override
  _IncentivePortalState createState() => _IncentivePortalState();
}


class _IncentivePortalState extends State<IncentivePortal> {
  CollectionReference icentive = FirebaseFirestore.instance.collection(
      'icentive');

  // Set the initial filter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icentive Page"),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                stream: icentive.snapshots(),
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
                      var data = documents[index].data() as Map<String,
                          dynamic>;

                      return GestureDetector(
                        // onTap: () {
                        //   // Handle the click event here, e.g., navigate to a new page or show a dialog
                        //   _showDetailsDialog(data);
                        // },
                        child: Card(
                          margin: EdgeInsets.all(10),
                          elevation: 4,
                          // Text('Rating: ${data['rating'] ?? ''} 🌟'),
                          //                                       Text('(${data['reviews'] ?? ''})'),
                          child: ListTile(
                            title: Text(
                                'Name Of Reward: ${data['reward'] ?? ''} '),
                            subtitle: Text(
                                'Worth Of Rs: ${data['amount'] ?? ''} '),
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
                            // Add more card content here based on your data
                          ),
                        ),
                      );
                    },
                  );
                },
              )

          ),
        ],
      ),
    );
  }
}
