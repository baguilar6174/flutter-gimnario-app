import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gimnario_app/dependencies_injection.dart';
import 'package:flutter_gimnario_app/features/features.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),
  exercises("/exercise"),
  report("/report"),
  profile("/profile");

  const Routes(this.path);
  final String path;
}

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.splashScreen.path,
      name: Routes.splashScreen.name,
      builder: (_, __) => BlocProvider(
        create: (_) => sl<SeedCubit>()..createSeed(),
        child: const SplashPage(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => HomePage(
        navigationShell: shell,
      ),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.root.path,
            name: Routes.root.name,
            builder: (_, __) => BlocProvider(
              create: (_) => sl<WorkoutCubit>(),
              child: const WorkoutPage(),
            ),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.exercises.path,
            name: Routes.exercises.name,
            builder: (_, __) => BlocProvider(
              create: (_) => sl<ExercisesCubit>()..fetchExercises(),
              child: const ExercisesPage(),
            ),
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
  initialLocation: Routes.splashScreen.path,
  routerNeglect: true,
  debugLogDiagnostics: kDebugMode,
);
