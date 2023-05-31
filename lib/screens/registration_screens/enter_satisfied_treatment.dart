import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SatisfiedTreatmenteScreen extends StatefulWidget {
  @override
  _SatisfiedTreatmenteScreen createState() => _SatisfiedTreatmenteScreen();
}

class _SatisfiedTreatmenteScreen extends State<SatisfiedTreatmenteScreen> {
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
              "Are you satisfied with the overall treatment that you get?".tr(),
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
