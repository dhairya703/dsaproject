import 'package:flutter/material.dart';

class Case {
  final String caseNumber;
  final String clientName;
  final String registrationDate;
  final String previousDate;
  final String yearOfCase;
  final String nextHearing;
  final String? court;

  Case({
    required this.caseNumber,
    required this.clientName,
    required this.registrationDate,
    required this.previousDate,
    required this.yearOfCase,
    required this.nextHearing,
    this.court,
  });
}

class CreateCaseForm extends StatefulWidget {
  @override
  _CreateCaseFormState createState() => _CreateCaseFormState();
}

class _CreateCaseFormState extends State<CreateCaseForm> {
  final TextEditingController _caseNumberController = TextEditingController();
  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _registrationDateController =
  TextEditingController();
  final TextEditingController _previousDateController = TextEditingController();
  final TextEditingController _yearOfCaseController = TextEditingController();
  final TextEditingController _nextHearingController = TextEditingController();
  String? _selectedCourt;

  final List<String> courts = ['Supreme Court', 'High Court', 'District Court'];

  Future<void> _selectDate(TextEditingController controller) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Case Number:'),
            TextFormField(
              controller: _caseNumberController,
              decoration: InputDecoration(
                hintText: 'Enter case number',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Client Name:'),
            TextFormField(
              controller: _clientNameController,
              decoration: InputDecoration(
                hintText: 'Enter client name',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Registration Date:'),
            InkWell(
              onTap: () => _selectDate(_registrationDateController),
              child: IgnorePointer(
                child: TextFormField(
                  controller: _registrationDateController,
                  decoration: InputDecoration(
                    hintText: 'Select registration date',
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Previous Date:'),
            InkWell(
              onTap: () => _selectDate(_previousDateController),
              child: IgnorePointer(
                child: TextFormField(
                  controller: _previousDateController,
                  decoration: InputDecoration(
                    hintText: 'Select previous date',
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Year of Case:'),
            TextFormField(
              controller: _yearOfCaseController,
              decoration: InputDecoration(
                hintText: 'Enter year of case',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Next Hearing:'),
            InkWell(
              onTap: () => _selectDate(_nextHearingController),
              child: IgnorePointer(
                child: TextFormField(
                  controller: _nextHearingController,
                  decoration: InputDecoration(
                    hintText: 'Select next hearing date',
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Name of Court:'),
            DropdownButtonFormField<String>(
              value: _selectedCourt,
              items: courts.map((court) {
                return DropdownMenuItem<String>(
                  value: court,
                  child: Text(court),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCourt = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String caseNumber = _caseNumberController.text;
                final String clientName = _clientNameController.text;
                final String registrationDate =
                    _registrationDateController.text;
                final String previousDate = _previousDateController.text;
                final String yearOfCase = _yearOfCaseController.text;
                final String nextHearing = _nextHearingController.text;

                // Create a Case object with the submitted data
                Case newCase = Case(
                  caseNumber: caseNumber,
                  clientName: clientName,
                  registrationDate: registrationDate,
                  previousDate: previousDate,
                  yearOfCase: yearOfCase,
                  nextHearing: nextHearing,
                  court: _selectedCourt,
                );

                // Navigate to the Case List page and pass the Case object
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaseListScreen(newCase: newCase),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _caseNumberController.dispose();
    _clientNameController.dispose();
    _registrationDateController.dispose();
    _previousDateController.dispose();
    _yearOfCaseController.dispose();
    _nextHearingController.dispose();
    super.dispose();
  }
}

class CaseListScreen extends StatelessWidget {
  final Case? newCase; // The Case object passed from the Create Case page

  CaseListScreen({this.newCase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case List'),
      ),
      body: Column(
        children: [
          if (newCase != null)
            ListTile(
              title: Text('Case #${newCase!.caseNumber}'),
              subtitle: Text('Client: ${newCase!.clientName}'),
              trailing: Text('Status: Open'), // You can add status here
            ),
          // Other case list items
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the screen for creating a new case.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateCaseForm()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


