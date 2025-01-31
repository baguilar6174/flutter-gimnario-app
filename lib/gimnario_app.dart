import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/features.dart';

class GimnarioApp extends StatelessWidget {
  const GimnarioApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaler: TextScaler.noScaling,
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
      title: 'Gimnario App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(255, 121, 198, 1),
        ),
      ),
    );
  }
}
