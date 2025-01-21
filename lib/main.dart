import 'package:flutter/material.dart';

import 'features/features.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gimnario App',
      debugShowCheckedModeBanner: false,
      home: ExcercisePage(),
    );
  }
}
