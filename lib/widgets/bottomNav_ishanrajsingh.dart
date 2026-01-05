import 'package:flutter/material.dart';

class BottomNavIshanrajsingh extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const BottomNavIshanrajsingh({
    super.key,
    this.currentIndex = 0,
    required this.onTabSelected,
  });

  @override
  State<BottomNavIshanrajsingh> createState() =>
      _BottomNavIshanrajsinghState();
}

class _BottomNavIshanrajsinghState extends State<BottomNavIshanrajsingh> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTabSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
