import 'package:flutter/material.dart';

import 'package:flutter_gimnario_app/core/core.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: Strings.of(context)!.workout,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_handball),
          label: Strings.of(context)!.excercise,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: Strings.of(context)!.report,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: Strings.of(context)!.profile,
        ),
      ],
    );
  }
}
