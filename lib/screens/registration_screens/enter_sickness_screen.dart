import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'enter_time_of_sickness.dart';

class SicknessSelectionScreen extends StatefulWidget {
  @override
  _SicknessSelectionScreenState createState() =>
      _SicknessSelectionScreenState();
}

class _SicknessSelectionScreenState extends State<SicknessSelectionScreen> {
  String _selectedSickness = '';

  void _selectSickness(String sickness) {
    setState(() {
      _selectedSickness = sickness;
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
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'What type of sickness do you have?'.tr(),
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => _selectSickness('Essential tremor'),
              style: ElevatedButton.styleFrom(
                primary: _selectedSickness == 'Essential tremor'
                    ? Colors.brown
                    : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Essential tremor'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectSickness('Parkinson'),
              style: ElevatedButton.styleFrom(
                primary: _selectedSickness == 'Parkinson' ? Colors.pink : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Parkinson'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectSickness('Ataxia'),
              style: ElevatedButton.styleFrom(
                primary: _selectedSickness == 'Ataxia' ? Colors.grey : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Ataxia'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectSickness('Multiple Sclerosis'),
              style: ElevatedButton.styleFrom(
                primary: _selectedSickness == 'Multiple Sclerosis'
                    ? Colors.orange
                    : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Multiple Sclerosis'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectSickness('ALS'),
              style: ElevatedButton.styleFrom(
                primary: _selectedSickness == 'ALS' ? Colors.red : null,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'ALS'.tr(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Process the selected sickness here
                print('Selected sickness: $_selectedSickness');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DurationSelectionScreen()),
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
