import 'enter_medicians_screen.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AgeSelectionScreen extends StatefulWidget {
  @override
  _AgeSelectionScreenState createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  String _selectedAge;
  TextEditingController _searchController = TextEditingController();
  List<String> ages = List<String>.generate(121, (index) => index.toString());

  List<String> filteredAges = [];

  @override
  void initState() {
    super.initState();
    filteredAges = ages;
    _searchController.addListener(filterAges);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterAges() {
    final searchText = _searchController.text.toLowerCase();
    setState(() {
      filteredAges = ages
          .where((age) => age.toLowerCase().startsWith(searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'What is your age?'.tr(),
                        style: TextStyle(fontSize: 35),
                      ),
                    ],
                  ),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredAges.length,
                      itemBuilder: (context, index) {
                        final age = filteredAges[index];
                        return ListTile(
                          title: Text(
                            age,
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedAge = age;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Process the selected age here
                      print('Selected age: $_selectedAge');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicationSelectionScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Submit'.tr(),
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
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
