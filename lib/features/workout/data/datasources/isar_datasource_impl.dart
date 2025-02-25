import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/exercises/exercises.dart';
import 'package:flutter_gimnario_app/features/workout/workout.dart';

class IsarLocalWorkoutDatasourceImpl implements WorkoutDatasource {
  final Isar db;

  const IsarLocalWorkoutDatasourceImpl(this.db);

  @override
  Future<Either<Failure, Unit>> create() async {
    try {
      // Clear existing data (optional)
      await db.writeTxn(() async {
        await db.workoutModels.clear();
      });

      final pushUp =
          await db.exerciseModels.filter().nameEqualTo("Push-up").findFirst();
      final squat =
          await db.exerciseModels.filter().nameEqualTo("Squat").findFirst();

      if (pushUp == null || squat == null) return Left(NoDataFailure());

      // Define workouts exercises, link with exercises
      final pushUpWorkout = WorkoutExerciseModel()
        ..exerciseId = pushUp.id
        ..sets = 3
        ..reps = 10
        ..restTime = 60;

      final squatWorkout = WorkoutExerciseModel()
        ..exerciseId = squat.id
        ..sets = 4
        ..reps = 12
        ..restTime = 45;

      // Define workout
      final workout = WorkoutModel()
        ..name = "Full Body Workout"
        ..workoutExercises.addAll([pushUpWorkout, squatWorkout]);

      await db.writeTxn(() async {
        await db.workoutModels.put(workout);
      });

      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workout>>> workouts() async {
    try {
      final response = await db.workoutModels.where().findAll();
      final workouts = response.map((model) => model.toEntity()).toList();
      return Right(workouts);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
