import 'package:flutter/material.dart';

import 'package:flutter_gimnario_app/features/features.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profile"),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
