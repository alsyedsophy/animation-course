import 'package:flutter/material.dart';

class AnimatedFooOpacity extends StatefulWidget {
  const AnimatedFooOpacity({super.key});

  @override
  State<AnimatedFooOpacity> createState() => _AnimatedFooOpacityState();
}

class _AnimatedFooOpacityState extends State<AnimatedFooOpacity> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              curve: Curves.bounceIn,
              opacity: opacity,
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                if (opacity == 0) {
                  setState(() {
                    opacity = 1;
                  });
                } else {
                  setState(() {
                    opacity = 0;
                  });
                }
              },
              child: Text("Change"),
            ),
          ],
        ),
      ),
    );
  }
}
