import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: CustomAppBar(title: Strings.of(context)!.workout),
      floatingButton: FloatingActionButton(
        onPressed: () => context.read<WorkoutCubit>().create(),
        child: const Icon(Icons.add),
      ),
      child: Center(
        child: Text(Strings.of(context)!.workout),
      ),
    );
  }
}
