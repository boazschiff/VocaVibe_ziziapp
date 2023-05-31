import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'enter_sickness_screen.dart';

class MedicationSelectionScreen extends StatefulWidget {
  @override
  _MedicationSelectionScreenState createState() =>
      _MedicationSelectionScreenState();
}

class _MedicationSelectionScreenState extends State<MedicationSelectionScreen> {
  List<String> _selectedMedications = [];

  void _toggleMedication(String medication) {
    setState(() {
      if (_selectedMedications.contains(medication)) {
        _selectedMedications.remove(medication);
      } else {
        _selectedMedications.add(medication);
      }
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
                  'What medications are you taking?'.tr(),
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => _toggleMedication('A'),
              style: ElevatedButton.styleFrom(
                primary:
                    _selectedMedications.contains('A') ? Colors.brown : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'A'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _toggleMedication('B'),
              style: ElevatedButton.styleFrom(
                primary:
                    _selectedMedications.contains('B') ? Colors.pink : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'B'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _toggleMedication('C'),
              style: ElevatedButton.styleFrom(
                primary:
                    _selectedMedications.contains('C') ? Colors.grey : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'C'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _toggleMedication('D'),
              style: ElevatedButton.styleFrom(
                primary:
                    _selectedMedications.contains('D') ? Colors.orange : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'D'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _toggleMedication('E'),
              style: ElevatedButton.styleFrom(
                primary: _selectedMedications.contains('E') ? Colors.red : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'E'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Process the selected medications here
                print('Selected medications: $_selectedMedications');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SicknessSelectionScreen()),
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
