import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';

void main() {
  runApp(MyApp());
}

int mode = 0;
String name = 'torch on';
double eleVal = 20;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
            child: Center(
              child: Status(),
            ),
            //GestureDetector(
            //   onHorizontalDragEnd: (DragEndDetails) {
            //     TorchCompat.turnOn();
            //   },
            //   onVerticalDragEnd: (DragEndDetails) {
            //     TorchCompat.turnOff();
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: eleVal,
      color: Colors.white,
      child: Text(name),
      onPressed: () {
        print('pressed');
        setState(() {
          name = 'torch off';

          if (mode == 0) {
            mode = 1;
            name = 'torch off';
            TorchCompat.turnOn();
            eleVal = 20;
          } else {
            mode = 0;
            name = 'torch on';
            TorchCompat.turnOff();
            eleVal = 0;
          }
          print(mode);
        });
      },
    );
  }
}
