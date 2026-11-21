import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: 100),
            duration: Duration(seconds: 2),
            builder: (context, value, child) => Text(
              "$value",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: Colors.lightBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
