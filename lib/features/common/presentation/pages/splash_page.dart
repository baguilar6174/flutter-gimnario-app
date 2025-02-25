import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gimnario_app/features/features.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<SeedCubit, bool>(
        listenWhen: (previous, current) => current, // Only listen when true
        listener: (context, isInitialized) {
          if (isInitialized) {
            context.go(Routes.root.path); // Redirect to Home
          }
        },
        child: const Center(child: Loading()),
      ),
    );
  }
}
