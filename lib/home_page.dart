import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _dimention = 100;
  double _raduis = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Foo Widget"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _containerWidget(),
              const Spacer(),
              _animatedButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _containerWidget() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOutBack,
      height: _dimention,
      width: _dimention,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(_raduis),
      ),
    );
  }

  Widget _animatedButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _dimention = _dimention == 100 ? 200 : 100;
          _raduis = _raduis == 12 ? 24 : 12;
        });
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
      child: Text("Start Animation"),
    );
  }
}
