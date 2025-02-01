import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';

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

    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, __) {
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
          title: Constants.get.appName,
          theme: themeLight(context),
          darkTheme: themeDark(context),
          themeMode: ThemeMode.dark,
        );
      },
    );
  }
}
