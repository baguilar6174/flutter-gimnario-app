part of 'exercises_cubit.dart';

@immutable
sealed class ExerciseState {}

final class LoadingState extends ExerciseState {}

final class InitialState extends ExerciseState {}

final class SuccessState extends ExerciseState {
  final List<Exercise> exercises;
  SuccessState(this.exercises);
}

final class FailureState extends ExerciseState {
  final String message;
  FailureState(this.message);
}

final class EmptyState extends ExerciseState {}
