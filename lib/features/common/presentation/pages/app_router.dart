import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gimnario_app/features/features.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

enum Routes {
  root("/"),
  excercise("/excercise"),
  report("/report"),
  profile("/profile");

  const Routes(this.path);
  final String path;
}

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.root.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => HomePage(
        navigationShell: shell,
      ),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.root.path,
            name: Routes.root.name,
            builder: (context, state) => WorkoutPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.excercise.path,
            name: Routes.excercise.name,
            builder: (context, state) => ExcercisePage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.report.path,
            name: Routes.report.name,
            builder: (context, state) => ReportPage(),
          ),
        ]),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile.path,
              name: Routes.profile.name,
              builder: (context, state) => ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
