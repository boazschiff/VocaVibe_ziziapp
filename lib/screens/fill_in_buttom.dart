import 'package:flutter/material.dart';

class FillingButtom extends StatefulWidget {
  String buttomText;
  Duration duration;
  bool fillin;
  FillingButtom(this.buttomText, this.duration, this.fillin);
  @override
  _FillingButtomState createState() => _FillingButtomState();
}

class _FillingButtomState extends State<FillingButtom>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  double _fillPercentage = 0.0;
  String buttomText;
  Duration duration;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust the duration as needed
    )..addListener(() {
        setState(() {
          _fillPercentage = _animationController.value;
        });
      });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void startFilling() {
    _animationController?.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    GestureDetector gestureDetector = GestureDetector(
      key: widget.key,
      onTap: startFilling,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: _fillPercentage * 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            Center(
              child: Text(
                'Tap to Fill',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              //Trigger the GestureDetector onTap event.
              gestureDetector.onTap();
            },
            child: Text("Click Here"),
          ),
          gestureDetector
        ],
      ),
    );
  }
}
