import 'package:animations_full_course/counter_screen.dart';
import 'package:animations_full_course/foo_transition/home_screen.dart';
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
              PushPageButton(page: HomeScreen(), pageName: "Home Screen"),
              const SizedBox(height: 20),
              PushPageButton(page: CounterScreen(), pageName: "Counter"),
              const SizedBox(height: 20),
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

class PushPageButton extends StatelessWidget {
  const PushPageButton({super.key, required this.page, required this.pageName});

  final Widget page;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text("Go To $pageName"),
    );
  }
}
