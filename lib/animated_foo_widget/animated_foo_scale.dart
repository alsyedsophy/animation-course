import 'package:flutter/material.dart';

class AnimatedFooScale extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedFooScale> createState() => _AnimatedFooScaleState();
}

class _AnimatedFooScaleState extends State<AnimatedFooScale> {
  double scale = 1;

  void change() {
    if (scale == 1) {
      setState(() {
        scale = 10;
      });
    } else {
      setState(() {
        scale = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Column(
        //       children: [
        //         Transform.scale(
        //           scale: 5,
        //           child: Container(height: 50, width: 50, color: Colors.red),
        //         ),
        //       ],
        //     ),

        //     ElevatedButton(onPressed: change, child: Text("change")),
        //   ],
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                AnimatedScale(
                  duration: Duration(seconds: 100),
                  curve: Curves.bounceInOut,
                  filterQuality: FilterQuality.medium,
                  scale: scale,
                  child: Container(height: 50, width: 50, color: Colors.red),
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
