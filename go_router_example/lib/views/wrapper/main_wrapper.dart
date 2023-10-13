import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  Widget buildTabIndex(String title, String route, int index) {
    return TextButton(
        onPressed: () {
          _goBranch(index);
        },
        child: Text(title));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTabIndex("Social", "", 0),
                buildTabIndex("Booking", "", 1),
                buildTabIndex("Notification", "", 2),
                buildTabIndex("Watch", "", 3),
                buildTabIndex("MegaMenu", "", 4),
              ],
            ),
            Expanded(child: widget.navigationShell)
          ],
        ),
      ),
    );
  }
}
