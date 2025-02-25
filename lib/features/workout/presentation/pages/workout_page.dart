import 'package:flutter/cupertino.dart';
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
      child: RefreshIndicator(
        color: Theme.of(context).extension<AppColors>()!.pink,
        backgroundColor: Theme.of(context).extension<AppColors>()!.background,
        onRefresh: () => context.read<WorkoutCubit>().fetchWorkouts(),
        child: BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (_, state) {
            if (state is WorkoutInitialState) return const SizedBox.shrink();
            if (state is WorkoutLoadingState) const Center(child: Loading());
            if (state is WorkoutSuccessState) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.workouts.length,
                padding: EdgeInsets.symmetric(vertical: Dimens.space16),
                itemBuilder: (_, index) {
                  return index < (state.workouts.length)
                      ? _workoutItem(state.workouts[index], context)
                      : Padding(
                          padding: EdgeInsets.all(Dimens.space16),
                          child: const Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        );
                },
              );
            }
            if (state is WorkoutFailureState) {
              return Center(child: Empty(errorMessage: state.message));
            }
            return const Center(child: Empty());
          },
        ),
      ),
    );
  }

  Container _workoutItem(Workout workout, BuildContext context) {
    return Container(
      decoration: BoxDecorations(context).card,
      margin: EdgeInsets.symmetric(
        vertical: Dimens.space8,
        horizontal: Dimens.space16,
      ),
      padding: EdgeInsets.all(Dimens.space8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacerH(value: Dimens.space16),
          Text(
            workout.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            Strings.of(context)!.workoutExercisesCount(
              workout.workoutExercises.length,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
