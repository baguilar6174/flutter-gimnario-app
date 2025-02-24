import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final GetWorkouts getWorkouts;
  final CreateWorkout createWorkout;

  WorkoutCubit({
    required this.getWorkouts,
    required this.createWorkout,
  }) : super(WorkoutInitialState());

  Future<void> fetchWorkouts() async {
    emit(WorkoutLoadingState());

    final data = await getWorkouts.call(NoParams());
    data.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(WorkoutFailureState(failure.message ?? ""));
          return;
        } else if (failure is NoDataFailure) {
          emit(WorkoutEmptyState());
        }
      },
      (data) => emit(WorkoutSuccessState(data)),
    );
  }

  Future<void> create() async {
    emit(WorkoutLoadingState());

    final data = await createWorkout.call(NoParams());
    data.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(WorkoutFailureState(failure.message ?? ""));
        }
      },
      (data) async {
        await Future.delayed(const Duration(milliseconds: 500));
        emit(WorkoutEmptyState());
      },
    );
  }
}
