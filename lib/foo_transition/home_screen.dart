import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// there is singleTickerProviderStateMixin to use single animation controller

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<AlignmentGeometry> greenAnimation;
  late Animation<AlignmentGeometry> amberAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: Duration(seconds: 2),
    );

    greenAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(_animationController);
    amberAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foo Transistion'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(children: [_stackWidget(), _controlButtons()]),
      ),
    );
  }

  Wrap _controlButtons() {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        ElevatedButton(onPressed: () {}, child: Text("Forward")),
        ElevatedButton(onPressed: () {}, child: Text("Reverse")),
        ElevatedButton(onPressed: () {}, child: Text("Stop")),
        ElevatedButton(onPressed: () {}, child: Text("Reset")),
        ElevatedButton(
          onPressed: () {},
          child: Text("Repeat (revese = false)"),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Repeat (revese = true)")),
      ],
    );
  }

  Widget _stackWidget() {
    return Expanded(
      child: Stack(
        children: [
          AlignTransition(
            alignment: greenAnimation,
            child: CircleAvatar(backgroundColor: Colors.green),
          ),
          AlignTransition(
            alignment: amberAnimation,
            child: CircleAvatar(backgroundColor: Colors.amber),
          ),
        ],
      ),
    );
  }
}
