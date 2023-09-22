import 'package:flutter/material.dart';
class LawyerProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lawyer Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LawyerProfilePage(),
    );
  }
}

class LawyerProfilePage extends StatelessWidget {
  final String name = 'John Smith';
  final String practiceArea = 'Criminal Defense';
  final String description =
      'Experienced lawyer with a focus on criminal defense cases. Providing legal representation for over 10 years.';
  final String imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Fcard1.jpg?alt=media&token=b2633360-13f0-4115-8062-4ac36002fa99'; // Replace with a valid image URL
  final int casesWon = 100;
  final int casesLost = 20;
  final int experienceYears = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lawyer Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              'Name: $name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Practice Area: $practiceArea',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Description: $description',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildCircularInfoCard('Cases Won', casesWon.toString()),
                _buildCircularInfoCard('Cases Lost', casesLost.toString()),
                _buildCircularInfoCard('Experience', '$experienceYears years'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add any action you want when the button is pressed.
                // For example, contact the lawyer or view their cases.
              },
              child: Text('Contact Lawyer'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularInfoCard(String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}