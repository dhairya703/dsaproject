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
        title: Text("NYAYA BANDHU"),
      ),
      body: SingleChildScrollView(
        child:  Column(
            children: [Image.asset(
              "assets/images/employe.jpeg",
              // You can adjust the width and height as needed
              width: double.infinity, // Set the width to the full screen width
              height: 300, // Set the desired height
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
              Card(
                color: Color(0xff660033),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Add padding for better spacing
                      child: Text(
                        "Property",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DocumentCard(
                          imageAsset: "assets/images/will.jpg",
                          label: "Will Registration",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => property()),
                            );
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/poa.png",
                          label: "Power Of Attorney",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => property()),
                            );
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/giftdeed.jpg",
                          label: "Gift Deed",
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
                color: Color(0xff660033),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Add padding for better spacing
                      child: Text(
                        "Agreement and contracts",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DocumentCard(
                          imageAsset: "assets/images/agree.jpeg",
                          label: "Freelancer Agreement",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => agreement()),
                            );
                            // Handle the tap action for "Civil" document
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/agree.jpeg",
                          label: "Letter of Intent",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => agreement()),
                            );
                            // Handle the tap action for "Public Interest" document
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/agree.jpeg",
                          label: "Loan Agreement",
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
                color: Color(0xff660033),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Add padding for better spacing
                      child: Text(
                        "StartUp",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DocumentCard(
                          imageAsset: "assets/images/nda.jpeg",
                          label: "NDA",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => startup()),
                            );
                            // Handle the tap action for "Civil" document
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/will.jpeg",
                          label: "Will",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => startup()),
                            );
                            // Handle the tap action for "Public Interest" document
                          },
                        ),
                        DocumentCard(
                          imageAsset: "assets/images/employe.jpeg",
                          label: "Employee Agreement",
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
    bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
    backgroundColor: Color(0xffF5F5DC),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
    backgroundColor: Color(0xffF5F5DC),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
    backgroundColor: Color(0xffF9F5DC),
    ),
    ],
    )

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
