import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key, required this.title});
  final String title;
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}
