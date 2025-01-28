import 'package:flutter/material.dart';
import 'package:flutter_gimnario_app/features/features.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home-page';

  final Widget childPage;

  const HomePage({
    super.key,
    required this.childPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childPage,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
