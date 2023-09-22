import 'package:firestore/lawyerspage/cases/createcase.dart';
import 'package:flutter/material.dart';
class CaseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case List'),
      ),
      body: CaseListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the screen for creating a new case.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateCaseScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CaseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with actual data fetching logic from your database.
    List<Map<String, dynamic>> cases = [
      {
        'caseNumber': '12345',
        'clientName': 'John Doe',
        'caseStatus': 'Open',
        'image_url':'https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Flaw1.JPG?alt=media&token=0457752d-8d6d-4181-9014-27d1f49db26a',
      },
      {
        'caseNumber': '13478',
        'clientName': 'Jethalal',
        'caseStatus': 'Open',
         'image_url':'https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Flaw2.JPG?alt=media&token=25efcdd8-9b4c-4422-ba1d-496c28ae3da7',
      },
      {
        'caseNumber': '09345',
        'clientName': 'Dayaben',
        'caseStatus': 'Open',
         'image_url':'https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Flaw10.JPG?alt=media&token=bd48ba3b-69f6-4ee6-93b9-34136622107f',
      },
      {
        'caseNumber': '24689',
        'clientName': 'BabitaJi',
        'caseStatus': 'Closed',
        'image_url':'https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Flaw3.JPG?alt=media&token=97874d6d-455f-4505-a2d6-af1a0d25ac09',
      },
      {
        'caseNumber': '67890',
        'clientName': 'Jane Smith',
         'caseStatus': 'Closed',
         'image_url':'https://firebasestorage.googleapis.com/v0/b/newnew-1a703.appspot.com/o/images%2Flaw4.JPG?alt=media&token=6b7b6b50-3b55-4067-b630-e988b3c97edf',
      },
      // Add more case data here.
    ];

    return ListView.builder(
      itemCount: cases.length,
      itemBuilder: (BuildContext context, int index) {
        return CaseListItem(
          caseData: cases[index],
        );
      },
    );
  }
}

class CaseListItem extends StatelessWidget {
  final Map<String, dynamic> caseData;

  CaseListItem({required this.caseData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0, // Add elevation for a card-like appearance
      child: Column(
        children: <Widget>[
          // Add an image widget here, for example, an AssetImage or NetworkImage
          // Image.network(
          //   caseData['imageUrl'], // Replace with the image URL from your data
          //   height: 150, // Adjust the height as needed
          //   width: double.infinity, // Make the image span the card width
          //   fit: BoxFit.cover, // Adjust the fit as needed
          // ),
          ListTile(
            title: Text('Case #${caseData['caseNumber']}'),
            subtitle: Text('Client: ${caseData['clientName']}'),
            trailing: Text('Status: ${caseData['caseStatus']}'),
            onTap: () {
              // Navigate to the case details screen.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CaseDetailsScreen(caseData: caseData),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


class CreateCaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Case'),
      ),
      body: CreateCaseForm(),

    );
  }
}

class CaseDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> caseData;

  CaseDetailsScreen({required this.caseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Case #${caseData['caseNumber']}'),
            Text('Client: ${caseData['clientName']}'),
            Text('Status: ${caseData['caseStatus']}'),

            // Add more case details here.
          ],
        ),
      ),
    );
  }
}
