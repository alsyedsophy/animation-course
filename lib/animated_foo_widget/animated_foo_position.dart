import 'package:flutter/material.dart';

class AnimatedFooPosition extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedFooPosition> createState() => _AnimatedFooPositionState();
}

class _AnimatedFooPositionState extends State<AnimatedFooPosition> {
  double left = 5;
  // double right = 10;

  void change() {
    if (left == 5) {
      setState(() {
        left = 50;
        // right = 5;
      });
    } else {
      setState(() {
        left = 5;
        // right = 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(height: 100, width: 300, color: Colors.red),
                AnimatedPositioned(
                  duration: Duration(seconds: 2),
                  left: left,
                  // right: right,
                  curve: Curves.bounceOut,
                  child: FlutterLogo(),
                ),
              ],
            ),

            ElevatedButton(onPressed: change, child: Text("change")),
          ],
        ),
      ),
    );
  }
}
