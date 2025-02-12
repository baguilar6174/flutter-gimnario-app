part of 'excercise_cubit.dart';

@immutable
sealed class ExcerciseState {}

final class LoadingState extends ExcerciseState {}

final class InitialState extends ExcerciseState {}

final class SuccessState extends ExcerciseState {
  final List<Exercise> excercises;
  SuccessState(this.excercises);
}

final class FailureState extends ExcerciseState {
  final String message;
  FailureState(this.message);
}

final class EmptyState extends ExcerciseState {}
