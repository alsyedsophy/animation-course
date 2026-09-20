import 'package:flutter/material.dart';

class AnimatedFooAlign extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedFooAlign> createState() => _AnimatedFooAlignState();
}

class _AnimatedFooAlignState extends State<AnimatedFooAlign> {
  AlignmentGeometry alignment = Alignment.centerRight;

  void change() {
    if (alignment != Alignment.centerRight) {
      setState(() {
        alignment = Alignment.centerRight;
      });
    } else {
      setState(() {
        alignment = Alignment.centerLeft;
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
            AnimatedAlign(
              duration: Duration(seconds: 2),
              curve: Curves.bounceOut,
              alignment: alignment,
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
            ElevatedButton(onPressed: change, child: Text("Change")),
          ],
        ),
      ),
    );
  }
}
