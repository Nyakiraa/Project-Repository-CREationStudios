import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String currentRoute; // ✅ Added parameter

  const CustomBottomNavigationBar({super.key, required this.currentRoute}); // ✅ Fixed super parameter

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _getSelectedIndex(currentRoute),
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/events');
            break;
          case 2:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  int _getSelectedIndex(String route) {
    switch (route) {
      case '/':
        return 0;
      case '/events':
        return 1;
      case '/profile':
        return 2;
      default:
        return 0;
    }
  }
}
