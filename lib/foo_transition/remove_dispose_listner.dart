import 'package:flutter/material.dart';

class RemoveDisposeListner extends StatefulWidget {
  const new({super.key});

  @override
  State<RemoveDisposeListner> createState() => _RemoveDisposeListnerState();
}

class _RemoveDisposeListnerState extends State<RemoveDisposeListner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<AlignmentGeometry> _animationAlign;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    );

    _animationAlign = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remove and Dispose"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            AlignTransition(
              alignment: _animationAlign,
              child: CircleAvatar(backgroundColor: Colors.green, radius: 20),
            ),
            ElevatedButton(
              onPressed: () {
                _animationController.value == 0
                    ? _animationController.forward()
                    : _animationController.reverse();
              },
              child: Text("Animate"),
            ),
            _statusListnerContollerButtons(),
            _valuesListnerContollerButtons(),
          ],
        ),
      ),
    );
  }

  void _statusListner(AnimationStatus animationStatus) {
    print("$animationStatus =======================");
  }

  Row _statusListnerContollerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            _animationController.addStatusListener(_statusListner);
          },
          child: Text("Add Status Listner"),
        ),
        ElevatedButton(
          onPressed: () {
            _animationController.removeStatusListener(_statusListner);
          },
          child: Text("Remove Status Listner"),
        ),
      ],
    );
  }

  void _valueListner() {
    print("${_animationController.value} ==============");
  }

  Row _valuesListnerContollerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            _animationController.addListener(_valueListner);
          },
          child: Text("Add Value Listner"),
        ),
        ElevatedButton(
          onPressed: () {
            _animationController.removeListener(_valueListner);
          },
          child: Text("Remove Value Listner"),
        ),
      ],
    );
  }
}
