import 'package:firestore/displaying%20data.dart';
import 'package:firestore/userspage/civil.dart';
import 'package:firestore/userspage/corporate.dart';
import 'package:firestore/userspage/criminalpage.dart';
import 'package:firestore/userspage/intellectualproperty.dart';
import 'package:firestore/userspage/publicinterest.dart';
import 'package:firestore/userspage/userprofile.dart';
import 'package:firestore/widgets/roundbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Userplat extends StatefulWidget {
  const Userplat({Key? key}) : super(key: key);

  @override
  State<Userplat> createState() => _UserplatState();
}

class _UserplatState extends State<Userplat> {
  final List<String> cardData = [
    "Card 1",
    "Card 2",
    "Card 3",
    "Card 4",
    "Card 5",
  ];

  final List<String> cardImages = [
    "https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Fcard1.jpg?alt=media&token=b2633360-13f0-4115-8062-4ac36002fa99", // Replace with your image URLs
    "https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Fcard2.jpg?alt=media&token=afd76433-bf86-403d-bb19-877db6645568",

    "https://imgs.search.brave.com/pwEghb1RLI7NYHU1MHc7ZU4HVHqRUtM_LNUr4_9xIdM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/Y29udHJhY3RzY291/bnNlbC5jb20vc3Rh/dGljL2ltYWdlcy9j/b250cmFjdF90eXBl/cy9Db250cmFjdHND/b3Vuc2VsX0FmZmlk/YXZpdF9JbWFnZS40/MjNkNjRmYmM2ZDQu/anBn",
    "https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Fcard5.jpg?alt=media&token=8aacbdda-2944-40c1-9ed1-777c2d3090f9",
  ];
  int _selectedIndex = 0;
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
        MaterialPageRoute(builder: (context) =>  Userplat()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  DataFetch()),
      );
    }
    else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  ProfileScreen()),
      );
    }
  }


  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor:  Color(0xFF061E35),
      appBar: AppBar(
        backgroundColor: Color(0xff660033)
        , iconTheme: IconThemeData(color: Colors.white),
        title: Text('Nyay Bandhu',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Column(children: <Widget>[
            Container(
              height: 160, // Adjust the height as needed
              child: PageView.builder(
                itemCount: cardData.length-1,
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
                          height: 170, // Adjust the image height as needed
                          width: 320, // Adjust the image width as needed
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
            SizedBox(height: 5.0),
            Text(
              "Swipe Right for more information",
              style: TextStyle(fontSize: 12.0,color: Colors.white),
            ),
            Column(
              children: [
                Container(
                  width: 345,
                  height: 275,
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
                              // Handle the click event for the first container here
                              print("Container 1 clicked");
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
                                    'assets/images/img_layer1_black_900_02_38x50.png', // Replace with your image path
                                    width: 30, // Adjust the image size as needed
                                    height: 50,
                                    fit: BoxFit.fill, // You can use BoxFit to specify how the image should be fitted
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
                              // Handle the click event for the first container here
                              print("Container 2 clicked");
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
                                    'assets/images/img_group668.png', // Replace with your image path
                                    width: 60, // Adjust the image size as needed
                                    height: 60,
                                    fit: BoxFit.cover, // You can use BoxFit to specify how the image should be fitted
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
                              // Handle the click event for the first container here
                              print("Container 3 clicked");
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
                                    'assets/images/img_layer1_black_900_02.png', // Replace with your image path
                                    width: 60, // Adjust the image size as needed
                                    height: 60,
                                    fit: BoxFit.cover, // You can use BoxFit to specify how the image should be fitted
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
                              // Handle the click event for the first container here
                              print("Container 3 clicked");
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
                                    'assets/images/img_layer1_black_900_40x34.png', // Replace with your image path
                                    width: 30, // Adjust the image size as needed
                                    height: 50,
                                    fit: BoxFit.cover, // You can use BoxFit to specify how the image should be fitted
                                  ),
                                ),
                                //img_layer1_black_900_40x34
                                SizedBox(height: 15),
                                Text(
                                  'CONSULTANT',
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
                              // Handle the click event for the first container here
                              print("Container 3 clicked");
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
                                    'assets/images/img_layer1_black_900_39x39.png', // Replace with your image path
                                    width: 30, // Adjust the image size as needed
                                    height: 50,
                                    fit: BoxFit.fill, // You can use BoxFit to specify how the image should be fitted
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'LEGAL ADVICE',
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
                              // Handle the click event for the first container here
                              print("Container 3 clicked");
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
                                    'assets/images/img_screenshot20230919at320.png', // Replace with your image path
                                    width: 30, // Adjust the image size as needed
                                    height: 50,
                                    fit: BoxFit.fill, // You can use BoxFit to specify how the image should be fitted
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'SEE MORE',
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
            SizedBox(
              height: 20,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Criminal()),
                    );

                    // Add your custom logic here
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 67,
                        height: 89,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image:AssetImage("assets/images/img_rectangle53.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        'Criminal',
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
                ),
                GestureDetector(
        onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  civil()),
      );},
                  child: Column(
                    children: [
                      Container(
                        width: 67,
                        height: 89,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage("assets/images/img_rectangle61_96x84.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        'Civil',
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  public()),
                    );},
                  child: Column(
                    children: [
                      Container(
                        width: 67,
                        height: 89,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage("assets/images/img_rectangle62.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        'Public Interest',
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
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  corporate()),
                    );},
                  child: Column(
                    children: [
                      Container(
                        width: 67,
                        height: 89,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage("assets/images/img_rectangle63.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        'Corporate',
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  public()),
                    );},
                  child: Column(
                    children: [
                      Container(
                        width: 67,
                        height: 89,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage("assets/images/img_rectangle64.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        'Public Interest',
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  intellectual()),
                    );},
                  child: Column(
                    children: [
                      Container(
                        width: 67,
                        height: 89,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage("assets/images/img_rectangle65.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        'Intellectual Property',
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
                )
              ],
            ),
            SizedBox(height:10)

          ]),
        ],
      )),
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
