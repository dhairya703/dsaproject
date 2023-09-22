import 'package:firestore/documentation/agreement.dart';
import 'package:firestore/documentation/property.dart';
import 'package:firestore/documentation/startup.dart';
import 'package:flutter/material.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Documents Section"),
      ),
      body: SingleChildScrollView(
        child:  Column(
            children: [Image.asset(
              "assets/images/img_rectangle131.png",
              // You can adjust the width and height as needed
              width: double.infinity, // Set the width to the full screen width
              height: 300, // Set the desired height
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
              Card(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Add padding for better spacing
                      child: Text(
                        "Property",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DocumentCard(
                          imageAsset: "assets/images/img_rectangle61_96x84.png",
                          label: "Civil",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => property()),
                            );
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/img_rectangle62.png",
                          label: "Public Interest",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => property()),
                            );
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/img_rectangle63.png",
                          label: "Corporate",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => property()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Add padding for better spacing
                      child: Text(
                        "Document",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DocumentCard(
                          imageAsset: "assets/images/img_rectangle61_96x84.png",
                          label: "Civil",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => agreement()),
                            );
                            // Handle the tap action for "Civil" document
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/img_rectangle62.png",
                          label: "Public Interest",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => agreement()),
                            );
                            // Handle the tap action for "Public Interest" document
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/img_rectangle63.png",
                          label: "Corporate",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => agreement()),
                            );
                            // Handle the tap action for "Corporate" document
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Add padding for better spacing
                      child: Text(
                        "StartUp",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DocumentCard(
                          imageAsset: "assets/images/img_rectangle61_96x84.png",
                          label: "Civil",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => startup()),
                            );
                            // Handle the tap action for "Civil" document
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/img_rectangle62.png",
                          label: "Public Interest",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => startup()),
                            );
                            // Handle the tap action for "Public Interest" document
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/img_rectangle63.png",
                          label: "Corporate",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => startup()),
                            );
                            // Handle the tap action for "Corporate" document
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

    );
  }
}

class DocumentCard extends StatelessWidget {
  final String imageAsset;
  final String label;
  final VoidCallback onTap;

  DocumentCard({
    required this.imageAsset,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 67,
            height: 89,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
