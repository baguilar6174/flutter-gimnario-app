import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/features/workout/domain/domain.dart';

part 'workout_model.g.dart';

@Collection()
class WorkoutModel {
  Id id = Isar.autoIncrement;
  late String name;
  List<WorkoutExerciseModel> workoutExercises = [];

  // Convert WorkoutModel to an entity (simplified representation)
  Workout toEntity() {
    return Workout()
      ..name = name
      ..workoutExercises =
          workoutExercises.map((exercise) => exercise.toEntity()).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'workoutExercises': workoutExercises.map((mg) => mg.toJson()).toList(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'exerciseId': exerciseId,
      'sets': sets,
      'reps': reps,
      'restTime': restTime,
    };
  }
}
