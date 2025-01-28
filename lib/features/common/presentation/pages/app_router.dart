import 'package:go_router/go_router.dart';

import 'package:flutter_gimnario_app/features/features.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(childPage: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => WorkoutPage(),
        ),
        GoRoute(
          path: '/exercises',
          builder: (context, state) => const ExcercisePage(),
        ),
        GoRoute(
          path: '/report',
          builder: (context, state) => const ReportPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);
