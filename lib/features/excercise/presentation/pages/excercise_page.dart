import 'package:flutter/material.dart';

import 'package:flutter_gimnario_app/features/features.dart';

class ExcercisePage extends StatelessWidget {
  const ExcercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Excercises"),
      body: Center(
        child: Text('Excercises Page'),
      ),
    );
  }
}
