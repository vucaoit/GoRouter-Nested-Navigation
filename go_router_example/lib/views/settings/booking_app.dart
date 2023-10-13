import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingApp extends StatefulWidget {
  const BookingApp({super.key, required this.statefulNavigationShell});
final StatefulNavigationShell statefulNavigationShell;
  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  void _goBranch(int index) {
    widget.statefulNavigationShell.goBranch(
      index,
      initialLocation: index == widget.statefulNavigationShell.currentIndex,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: (){
                  _goBranch(0);
                }, child: Text("Flight")),
                TextButton(onPressed: (){
                  _goBranch(1);
                }, child: Text("Hotel")),
                TextButton(onPressed: (){
                  _goBranch(2);
                }, child: Text("Car")),
                TextButton(onPressed: (){
                  _goBranch(3);
                }, child: Text("Tour")),
              ],
            ),
            Expanded(child: widget.statefulNavigationShell)
          ],
        ),
      ),
    );
  }
}
