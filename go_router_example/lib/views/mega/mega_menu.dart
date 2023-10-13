import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MegaMenu extends StatefulWidget {
  const MegaMenu({super.key});

  @override
  State<MegaMenu> createState() => _MegaMenuState();
}

class _MegaMenuState extends State<MegaMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(onPressed: (){
            context.push("flight");
          },child: Text("Hotel"),),
        ),
      ),
    );
  }
}
