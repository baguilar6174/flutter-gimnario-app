import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/features/workout/domain/domain.dart';

part 'workout_model.g.dart';

@Collection()
class WorkoutModel {
  Id id = Isar.autoIncrement;
  late String name;
  final workoutExercises = <WorkoutExerciseModel>[];

  // Convert WorkoutModel to an entity (simplified representation)
  Workout toEntity() {
    return Workout()
      ..name = name
      ..workoutExercises =
          workoutExercises.map((exercise) => exercise.toEntity()).toList();
  }
}

@embedded
class WorkoutExerciseModel {
  int? exerciseId;
  int? sets;
  int? reps;
  int? restTime;

  WorkoutExercise toEntity() {
    return WorkoutExercise()
      ..exerciseId = exerciseId
      ..sets = sets
      ..reps = reps
      ..restTime = restTime;
  }
}
