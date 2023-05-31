import 'enter_satisfied_treatment.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreen createState() => _ExerciseScreen();
}

class _ExerciseScreen extends State<ExerciseScreen> {
  String selectedOption;

  void handleOptionChange(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  void submitSelection() {
    if (selectedOption != null) {
      print('Selected option: $selectedOption');
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SatisfiedTreatmenteScreen()),
    );
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Are you practicing the exercises given by the clinician?'.tr(),
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadioListTile(
                  title: Text(
                    'Yes'.tr(),
                    style: TextStyle(fontSize: 35),
                  ),
                  value: 'Yes',
                  groupValue: selectedOption,
                  onChanged: handleOptionChange,
                ),
                RadioListTile(
                  title: Text(
                    'No'.tr(),
                    style: TextStyle(fontSize: 35),
                  ),
                  value: 'No',
                  groupValue: selectedOption,
                  onChanged: handleOptionChange,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: submitSelection,
              child: Text(
                'Submit'.tr(),
                style: TextStyle(fontSize: 35),
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
