import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';

part 'excercise_state.dart';

class ExcerciseCubit extends Cubit<ExcerciseState> {
  final GetExercises _getExercises;

  ExcerciseCubit(this._getExercises) : super(LoadingState());

  Future<void> fetchExercises() async {
    emit(LoadingState());

    final data = await _getExercises.call(NoParams());
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureState(l.message ?? ""));
        } else if (l is NoDataFailure) {
          emit(EmptyState());
        }
      },
      (r) {
        emit(SuccessState(r));
      },
    );
  }
}
