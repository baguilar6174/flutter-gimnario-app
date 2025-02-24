part of 'workout_cubit.dart';

@immutable
sealed class WorkoutState {}

final class WorkoutLoadingState extends WorkoutState {}

final class WorkoutInitialState extends WorkoutState {}

final class WorkoutSuccessState extends WorkoutState {
  final List<Workout> workouts;
  WorkoutSuccessState(this.workouts);
}

final class WorkoutFailureState extends WorkoutState {
  final String message;
  WorkoutFailureState(this.message);
}

final class WorkoutEmptyState extends WorkoutState {}
