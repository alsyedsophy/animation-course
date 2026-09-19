import 'package:flutter/material.dart';

class AnimatedFooContainer extends StatefulWidget {
  const AnimatedFooContainer({super.key});

  @override
  State<AnimatedFooContainer> createState() => _AnimatedFooContainerState();
}

class _AnimatedFooContainerState extends State<AnimatedFooContainer> {
  double width = 100;
  double height = 100;
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 3),
              curve: Curves.bounceIn,
              onEnd: () =>
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("data"))),
              width: width,
              height: height,
              color: color,
            ),

            ElevatedButton(
              onPressed: () {
                if (width == 100) {
                  setState(() {
                    width = 200;
                    height = 200;
                    color = Colors.green;
                  });
                } else {
                  setState(() {
                    width = 100;
                    height = 100;
                    color = Colors.red;
                  });
                }
              },
              child: Text('Change'),
            ),
          ],
        ),
      ),
    );
  }
}
