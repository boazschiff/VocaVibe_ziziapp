import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'enter_age_screen.dart';

class GenderSelectionScreen extends StatefulWidget {
  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String _selectedGender = '';

  TextEditingController _otherGenderController = TextEditingController();

  @override
  void dispose() {
    _otherGenderController.dispose();
    super.dispose();
  }

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select your gender:'.tr(),
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => _selectGender('Male'),
              style: ElevatedButton.styleFrom(
                primary: _selectedGender == 'Male' ? Colors.blue : Colors.green,
                minimumSize: Size(double.infinity, 60), // Set the button's size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  // Set button's border radius
                ),
              ),
              child: Text(
                'Male'.tr(),
                style: TextStyle(fontSize: 40),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectGender('Female'),
              style: ElevatedButton.styleFrom(
                primary:
                    _selectedGender == 'Female' ? Colors.pink : Colors.green,
                minimumSize: Size(double.infinity, 60), // Set the button's size
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Set button's border radius
                ),
              ),
              child: Text(
                'Female'.tr(),
                style: TextStyle(fontSize: 40),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectGender('Other'),
              style: ElevatedButton.styleFrom(
                primary:
                    _selectedGender == 'Other' ? Colors.grey : Colors.green,
                minimumSize: Size(double.infinity, 60), // Set the button's size
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Set button's border radius
                ),
              ),
              child: Text(
                'Other'.tr(),
                style: TextStyle(fontSize: 40),
              ),
            ),
            if (_selectedGender == 'Other')
              TextField(
                controller: _otherGenderController,
                decoration: InputDecoration(
                  labelText: 'Enter your gender'.tr(),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                String gender = _selectedGender;
                if (_selectedGender == 'Other') {
                  gender = _otherGenderController.text;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeSelectionScreen()),
                );
                // Process the selected gender here
                print('Selected gender: $gender'); //need to be complited
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Set the button's background color
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Colors.blue,
                // Set the button's size
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Set button's border radius
                ),
              ),
              child: Text(
                'Submit'.tr(),
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
