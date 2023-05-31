import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'enter_number_screen.dart';

class DurationSelectionScreen extends StatefulWidget {
  @override
  _DurationSelectionScreenState createState() =>
      _DurationSelectionScreenState();
}

class _DurationSelectionScreenState extends State<DurationSelectionScreen> {
  String _selectedDuration = '';

  void _selectDuration(String duration) {
    setState(() {
      _selectedDuration = duration;
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'How long have you been sick?'.tr(),
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => _selectDuration('Less than a year'),
              style: ElevatedButton.styleFrom(
                primary: _selectedDuration == 'Less than a year'
                    ? Colors.brown
                    : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Less than a year'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectDuration('1-3 years'),
              style: ElevatedButton.styleFrom(
                primary: _selectedDuration == '1-3 years' ? Colors.pink : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                '1-3 years'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectDuration('3-5 years'),
              style: ElevatedButton.styleFrom(
                primary: _selectedDuration == '3-5 years' ? Colors.grey : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                '3-5 years'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectDuration('5-10 years'),
              style: ElevatedButton.styleFrom(
                primary:
                    _selectedDuration == '5-10 years' ? Colors.orange : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                '5-10 years'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectDuration('10+ years'),
              style: ElevatedButton.styleFrom(
                primary: _selectedDuration == '10+ years' ? Colors.red : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                '10+ years'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Process the selected duration here
                print('Selected duration: $_selectedDuration');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NumberEntryScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Submit'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
