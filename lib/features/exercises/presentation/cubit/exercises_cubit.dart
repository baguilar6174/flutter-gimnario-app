import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';

part 'exercises_state.dart';

class ExercisesCubit extends Cubit<ExerciseState> {
  final GetExercises _getExercises;

  ExercisesCubit(this._getExercises) : super(LoadingState());

  Future<void> fetchExercises() async {
    emit(LoadingState());

    final data = await _getExercises.call(NoParams());
    data.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(FailureState(failure.message ?? ""));
          return;
        } else if (failure is NoDataFailure) {
          emit(EmptyState());
        }
      },
      (data) => emit(SuccessState(data)),
    );
  }
}
