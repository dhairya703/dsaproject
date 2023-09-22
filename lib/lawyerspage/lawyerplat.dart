import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/displaying%20data.dart';
import 'package:firestore/documentation/documenthome.dart';
import 'package:firestore/help.dart';
import 'package:firestore/lawyerspage/CoinScreen.dart';
import 'package:firestore/lawyerspage/cases/caselist.dart';
import 'package:firestore/lawyerspage/hourlyconsultation.dart';
import 'package:firestore/lawyerspage/lawyerprofile.dart';
import 'package:firestore/lawyerspage/link.dart';
import 'package:firestore/lawyerspage/news.dart';
import 'package:firestore/lawyerspage/probono.dart';
import 'package:firestore/lawyerspage/requestshow.dart';
import 'package:firestore/userspage/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Lawyerplat extends StatefulWidget {
  const Lawyerplat({Key? key}) : super(key: key);

  @override
  _LawyerplatState createState() => _LawyerplatState();
}

class _LawyerplatState extends State<Lawyerplat> {
  final String url = 'https://example.com';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void>? _launched;
  final List<String> cardData = [
    "Card 1",
    "Card 2",
    "Card 3",
    "Card 4",
    "Card 5",
  ];

  final List<String> cardImages = [
    "https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Fcard1.jpg?alt=media&token=b2633360-13f0-4115-8062-4ac36002fa99",
    // Replace with your image URLs
    "https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Fcard2.jpg?alt=media&token=afd76433-bf86-403d-bb19-877db6645568",

    "https://imgs.search.brave.com/pwEghb1RLI7NYHU1MHc7ZU4HVHqRUtM_LNUr4_9xIdM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/Y29udHJhY3RzY291/bnNlbC5jb20vc3Rh/dGljL2ltYWdlcy9j/b250cmFjdF90eXBl/cy9Db250cmFjdHND/b3Vuc2VsX0FmZmlk/YXZpdF9JbWFnZS40/MjNkNjRmYmM2ZDQu/anBn",
    "https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Fcard5.jpg?alt=media&token=8aacbdda-2944-40c1-9ed1-777c2d3090f9",
  ];
  int _selectedIndex = 0;
  int currentIndex = 0;


  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different pages based on the selected index
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Lawyerplat()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewsList()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LawyerProfileApp()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(
      scheme: 'https',
      host: 'indiankanoon.org',
      path: 'browse/',
    );
    //https://services.ecourts.gov.in/ecourtindia_v6/
    final Uri tofetch = Uri(
      scheme: 'https',
      host: 'services.ecourts.gov.in',
      path: 'ecourtindia_v6/',
    );
    final Uri toCatch = Uri(
      scheme: 'https',
      host: 'www.helpinghands-team.org',
      path: '',
    );
    return Scaffold(
      backgroundColor:  Color(0xFF061E35),
      appBar: AppBar(
      backgroundColor: Color(0xff660033)
    , iconTheme: IconThemeData(color: Colors.white),
    title: Text('Nyay Bandhu',style: TextStyle(color: Colors.white),),


        actions: [
          IconButton(
            icon: Icon(Icons.monetization_on_outlined), // You can use any coin icon you prefer
            onPressed: () {
              // Add your coin button action here
              // This function will be called when the coin button is pressed.
              // You can navigate to a coin-related screen or perform any other action.
             Navigator.push(context, MaterialPageRoute(builder: (context) => IncentivePortal()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(child: Column(
        children: [

          Container(
            padding: EdgeInsets.all(10),
            height: 160, // Adjust the height as needed
            child: PageView.builder(
              itemCount: cardData.length - 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle card click here
                    // print("Card ${index + 1} clicked");
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        cardImages[index], // Use the corresponding image URL
                        height: 100, // Adjust the image height as needed
                        width: 200, // Adjust the image width as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Text("Swipe right to view more",style: TextStyle(color: Colors.white),),
          SizedBox(height: 10,),Column(
            children: [
              Container(
                width: 345,
                height: 390,
                decoration: ShapeDecoration(
                  color: Color(0xFF061E35),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFFCA311)),
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Services',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Adjust the alignment as needed
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Hourly() ),
                            );

                          },
                          child: Column(
                            children: [
                              Container(
                                width: 82,
                                height: 79,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(), // Use CircleBorder for oval shape
                                ),
                                child: Image.asset(
                                  'assets/images/img_layer1_black_900_02_38x50.png',
                                  // Replace with your image path
                                  width: 30, // Adjust the image size as needed
                                  height: 50,
                                  fit: BoxFit
                                      .fill, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Hourly Consultation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DocumentPage() ),
                            );

                          },
                          child: Column(
                            children: [
                              Container(
                                width: 82,
                                height: 79,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(), // Use CircleBorder for oval shape
                                ),
                                child: Image.asset(
                                  'assets/images/img_group668.png',
                                  // Replace with your image path
                                  width: 60, // Adjust the image size as needed
                                  height: 60,
                                  fit: BoxFit
                                      .cover, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'DOCUMENTATION',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CaseListScreen() ),
                            );

                          },
                          child: Column(
                            children: [
                              Container(
                                width: 82,
                                height: 79,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(), // Use CircleBorder for oval shape
                                ),
                                child: Image.asset(
                                  'assets/images/img_layer1_black_900_02.png',
                                  // Replace with your image path
                                  width: 60, // Adjust the image size as needed
                                  height: 60,
                                  fit: BoxFit
                                      .cover, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'DISPUTES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Adjust the alignment as needed
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FetchRequestsScreen() ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 82,
                                height: 79,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(), // Use CircleBorder for oval shape
                                ),
                                child: Image.asset(
                                  'assets/images/img_layer1_black_900_40x34.png',
                                  // Replace with your image path
                                  width: 30, // Adjust the image size as needed
                                  height: 50,
                                  fit: BoxFit
                                      .cover, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                              //img_layer1_black_900_40x34
                              SizedBox(height: 15),
                              Text(
                                'Requests',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            _launched = _launchInWebViewOrVC(toLaunch);
                            },),
                          child: Column(
                            children: [
                              Container(
                                width: 82,
                                height: 79,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                ),
                                child: Image.asset(
                                  'assets/images/img_layer1_black_900_39x39.png',
                                  width: 30,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Indian Kanoon',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  NewsList()),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 82,
                                height: 79,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(), // Use CircleBorder for oval shape
                                ),
                                child: Image.asset(
                                  'assets/images/img_screenshot20230919at320.png',
                                  // Replace with your image path
                                  width: 30, // Adjust the image size as needed
                                  height: 50,
                                  fit: BoxFit
                                      .fill, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Latest News',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Adjust the alignment as needed
                      children: [
                        GestureDetector(

                            onTap: () => setState(() {
                              _launched = _launchInWebViewOrVC(tofetch);
                            },),

                          child: Column(
                            children: [
                              Container(
                                width: 82,
                                height: 79,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(), // Use CircleBorder for oval shape
                                ),
                                child: Image.asset(
                                  'assets/images/img_layer1_black_900_40x34.png',
                                  // Replace with your image path
                                  width: 30, // Adjust the image size as needed
                                  height: 50,
                                  fit: BoxFit
                                      .cover, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                              //img_layer1_black_900_40x34
                              SizedBox(height: 15),
                              Text(
                                'Ecourt',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  probono()),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 82,
                                height: 79,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                ),
                                child: Image.asset(
                                  'assets/images/img_layer1_black_900_39x39.png',
                                  width: 30,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Probonos',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  HelpPage()),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 82,
                                height: 79,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(), // Use CircleBorder for oval shape
                                ),
                                child: Image.asset(
                                  'assets/images/img_screenshot20230919at320.png',
                                  // Replace with your image path
                                  width: 30, // Adjust the image size as needed
                                  height: 50,
                                  fit: BoxFit
                                      .fill, // You can use BoxFit to specify how the image should be fitted
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Help',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),

          GestureDetector(

              onTap: () => setState(() {
                _launched = _launchInWebViewOrVC(toCatch);
              },
              ),
            child: Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              elevation: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Fhelping-logo.jpg?alt=media&token=33c6d234-09e8-47db-9605-fb989c89ed0e', // Replace with your image URL
                  fit: BoxFit.cover, // This ensures the image covers the entire card
                ),
              ),
            )
          ),
        ],)

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
            backgroundColor: Color(0xffF5F5DC),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xffF5F5DC),
        unselectedItemColor: Colors.black, // Set unselected item color to black
        selectedItemColor: Colors.black87,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
        selectedLabelStyle: TextStyle(color: Colors.black), // Set selected label color to black
        unselectedLabelStyle: TextStyle(color: Colors.black), // Set unselected label color to black
      ),


    );
  }
}
Future<void> _launchInWebViewOrVC(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $url');
  }
}

