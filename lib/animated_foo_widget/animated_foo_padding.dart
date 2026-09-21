import 'package:flutter/material.dart';

class AnimatedFooPadding extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedFooPadding> createState() => _AnimatedFooPaddingState();
}

class _AnimatedFooPaddingState extends State<AnimatedFooPadding> {
  double padding = 20;

  void change() {
    if (padding == 20) {
      setState(() {
        padding = 50;
      });
    } else {
      setState(() {
        padding = 20;
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
            AnimatedPadding(
              duration: Duration(seconds: 2),
              padding: EdgeInsets.all(padding),
              curve: Curves.bounceOut,
              child: Container(height: 100, width: 100, color: Colors.red),
            ),
            ElevatedButton(onPressed: change, child: Text("change")),
          ],
        ),
      ),
    );
  }
}
