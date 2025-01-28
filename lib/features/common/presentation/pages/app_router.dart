import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gimnario_app/features/features.dart';

import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.workoutPage,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => HomePage(
        navigationShell: shell,
      ),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.workoutPage,
            builder: (context, state) => WorkoutPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.excercisePage,
            builder: (context, state) => ExcercisePage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.reportPage,
            builder: (context, state) => ReportPage(),
          ),
        ]),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profilePage,
              builder: (context, state) => ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
