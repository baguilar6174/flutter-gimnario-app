import 'package:flutter/material.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.of(context)!.profile),
      body: Center(
        child: Text(Strings.of(context)!.profile),
      ),
    );
  }
}
