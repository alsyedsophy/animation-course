import 'package:flutter/material.dart';

class CustomButtonLoading extends StatefulWidget {
  const new({super.key});

  @override
  State<CustomButtonLoading> createState() => _CustomButtonLoadingState();
}

class _CustomButtonLoadingState extends State<CustomButtonLoading> {
  bool isLoading = false;

  void change() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(minutes: 1),
          width: isLoading ? 100 : 400,
          child: ElevatedButton(
            onPressed: change,
            child: isLoading ? CircularProgressIndicator() : Text("Login"),
          ),
        ),
      ),
    );
  }
}
