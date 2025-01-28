import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  int _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    switch (location) {
      case '/':
        return 0;
      case '/exercises':
        return 1;
      case '/report':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/exercises');
        break;
      case 2:
        context.go('/report');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color.fromRGBO(255, 121, 198, 1),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      currentIndex: _getCurrentIndex(context),
      onTap: (value) => _onItemTapped(context, value),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Workouts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_handball),
          label: 'Exercises',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Report',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
