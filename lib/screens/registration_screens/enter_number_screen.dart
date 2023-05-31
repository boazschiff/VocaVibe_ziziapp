import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'enter_clinicin_help.dart';

class NumberEntryScreen extends StatefulWidget {
  @override
  _NumberEntryScreenState createState() => _NumberEntryScreenState();
}

class _NumberEntryScreenState extends State<NumberEntryScreen> {
  String selectedPrefix = '+972'; // Default prefix for the United States
  TextEditingController phoneNumberController = TextEditingController();

  List<String> prefixOptions = [
    '+972', // Israel
    '+1', // United States
    '+44', // United Kingdom
    '+49', // Germany
    '+81', // Japan
    '+91', // India
    '+86', // China
  ];

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  void submitPhoneNumber() {
    String phoneNumber = selectedPrefix + phoneNumberController.text;
    // Validate phone number length
    if (phoneNumber.length != selectedPrefix.length + 10) {
      showSnackbar('Invalid phone number length'.tr());
      return;
    }
    // Validate phone number digits
    if (!phoneNumber.contains(RegExp(r'^\+?\d+$'))) {
      showSnackbar('Phone number should only contain digits'.tr());
      return;
    }
    // Phone number is valid
    print('Submitted phone number: $phoneNumber');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExerciseScreen()),
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
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
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Enter your phone number:'.tr(),
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedPrefix,
                  onChanged: (String newValue) {
                    setState(() {
                      selectedPrefix = newValue;
                    });
                  },
                  items: prefixOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: TextField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      labelText: 'Phone Number'.tr(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: submitPhoneNumber,
              child: Text(
                'Submit'.tr(),
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
