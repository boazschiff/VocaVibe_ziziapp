import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  final mybuttonkey;
  Home(this.mybuttonkey);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    // final mybuttonkey = GlobalKey();

    return  Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child:Column(
          children: [
              //button A
              ElevatedButton(
                key:widget.mybuttonkey,
                onPressed: (){
                  print("Button is pressed");
                },
                child: Text("My Button"),
              ),
               //Button B
              //  ElevatedButton(
              //   onPressed: () async {

              //       RenderBox renderbox = widget.mybuttonkey.currentContext.findRenderObject() as RenderBox;
              //       Offset position = renderbox.localToGlobal(Offset.zero);
              //       double x = position.dx;
              //       double y = position.dy;

              //       print(x);
              //       print(y);

              //       GestureBinding.instance.handlePointerEvent(PointerDownEvent(
              //         position: Offset(x, y),
              //       )); //trigger button up,

              //       GestureBinding.instance.handlePointerEvent(PointerUpEvent(
              //         position: Offset(x, y),
              //       )); //trigger button down
              //   }, 
              //   child: Text("Trigger Cick Button A")
              // )
          ]
        )
      ),
    );
  }
}