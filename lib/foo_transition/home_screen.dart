import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// there is singleTickerProviderStateMixin to use single animation controller

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _greenController;
  late AnimationController _amberController;
  late Animation<AlignmentGeometry> _greenAnimation;
  late Animation<AlignmentGeometry> _amberAnimation;

  @override
  void initState() {
    super.initState();
    _greenController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: Duration(seconds: 4),
    );
    _amberController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: Duration(seconds: 4),
    );

    _greenAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(_greenController);
    
    _amberAnimation =
        Tween<AlignmentGeometry>(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).animate(
          CurvedAnimation(
            parent: _amberController,
            curve: Curves.easeIn,
            reverseCurve: Curves.easeInBack,
          ),
        );

    _greenController.addStatusListener((status) {
      if (status == AnimationStatus.completed &&
          _amberController.status == AnimationStatus.dismissed) {
        _amberController.forward();
      }
      if (status == AnimationStatus.dismissed &&
          _amberController.status == AnimationStatus.completed) {
        _amberController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foo Transistion'),
        backgroundColor: Colors.blue,
      ),
      body: Column(children: [_stackWidget(), _controlButtons()]),
    );
  }

  Widget _controlButtons() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              _greenController.forward();
            },
            child: Text("Forward"),
          ),
          ElevatedButton(
            onPressed: () {
              _greenController.reverse();
            },
            child: Text("Reverse"),
          ),
          // ElevatedButton(
          //   onPressed: () => _animationController.stop(),
          //   child: Text("Stop"),
          // ),
          // ElevatedButton(
          //   onPressed: () => _animationController.reset(),
          //   child: Text("Reset"),
          // ),
          // ElevatedButton(
          //   onPressed: () => _animationController.repeat(),
          //   child: Text("Repeat (revese = false)"),
          // ),
          // ElevatedButton(
          //   onPressed: () => _animationController.repeat(reverse: true),
          //   child: Text("Repeat (revese = true)"),
          // ),
        ],
      ),
    );
  }

  Widget _stackWidget() {
    return Expanded(
      child: Stack(
        children: [
          AlignTransition(
            alignment: _greenAnimation,
            child: CircleAvatar(backgroundColor: Colors.green),
          ),
          AlignTransition(
            alignment: _amberAnimation,
            child: CircleAvatar(backgroundColor: Colors.amber),
          ),
        ],
      ),
    );
  }
}
