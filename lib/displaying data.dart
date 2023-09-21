import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataFetch extends StatefulWidget {
  @override
  _DataFetchState createState() => _DataFetchState();
}

enum FilterOption {
All,
  CriminalDefense,
  FamilyLaw,
  PersonalInjury,
  RealEstate,
  Immigration,
}

class _DataFetchState extends State<DataFetch> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FilterOption selectedFilter = FilterOption.All;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data"),
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
                  ? users.snapshots()
                  : users
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

                    return  Card(
                      margin: EdgeInsets.all(10),
                      elevation: 4,
                      child: ListTile(
                        title: Text(data['name'] ?? ''),
                        subtitle: Text(data['description'] ?? ''),
                        leading: data['images'] != null
                            ? Image.network(
                          data['images'],
                          errorBuilder: (context, error, stackTrace) {
                            // Display a placeholder image when there's an error
                            return Image.network('images'); // Replace with your placeholder image
                          },
                        )
                            : Image.asset('Image not available'), // Display a placeholder if 'image_url' is missing
                        // Add more card content here based on your data
                      ),
                    );
                      Card(
                      margin: EdgeInsets.all(10),
                      elevation: 4,
                      child: ListTile(
                        title: Text(data['name'] ?? ''),
                        subtitle: Text(data['description'] ?? ''),
                        leading: data['image_url'] != null
                            ? Image.network(data['image_url'])
                            : Container(),
                        // Add more card content here based on your data
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
}
