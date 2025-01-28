import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gimnario_app/features/features.dart';

class HomePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomePage({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('HomePage'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
      ),
    );
  }
}
