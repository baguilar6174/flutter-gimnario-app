import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/exercises/exercises.dart';

class IsarLocalDatasourceImpl implements ExercisesDatasource {
  final Isar db;

  const IsarLocalDatasourceImpl(this.db);

  @override
  Future<Either<Failure, List<Exercise>>> exercises() async {
    try {
      final response = await db.exerciseModels.where().findAll();
      final exercises = response.map((model) => model.toEntity()).toList();
      return Right(exercises);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MuscleGroup>>> muscleGroups() async {
    try {
      final response = await db.muscleGroupModels.where().findAll();
      final muscleGroups = response.map((model) => model.toEntity()).toList();
      return Right(muscleGroups);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> createSeed() async {
    try {
      await seedDatabase();
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> seedDatabase() async {
    // Clear existing data (optional)
    await db.writeTxn(() async {
      await db.exerciseModels.clear();
      await db.muscleGroupModels.clear();
    });

    // Define muscle groups
    final chest = MuscleGroupModel()
      ..name = 'Chest'
      ..description = 'Primary chest muscles';

    final legs = MuscleGroupModel()
      ..name = 'Legs'
      ..description = 'Primary leg muscles';

    final back = MuscleGroupModel()
      ..name = 'Back'
      ..description = 'Primary back muscles';

    final biceps = MuscleGroupModel()
      ..name = 'Biceps'
      ..description = 'Primary biceps muscles';

    // Define exercises
    final pushUp = ExerciseModel()
      ..name = 'Push-up'
      ..description = 'A classic bodyweight exercise for the chest'
      ..equipment = ['None']
      ..difficulty = 'Beginner'
      ..imageUrl = 'assets/images/push-up.gif';

    final benchPress = ExerciseModel()
      ..name = 'Bench Press'
      ..description = 'A compound exercise for the chest using a barbell'
      ..equipment = ['Barbell', 'Bench']
      ..difficulty = 'Intermediate'
      ..imageUrl = 'assets/images/bench-press.gif';

    final squat = ExerciseModel()
      ..name = 'Squat'
      ..description = 'A compound exercise for the legs using a barbell'
      ..equipment = ['Barbell']
      ..difficulty = 'Intermediate'
      ..imageUrl = 'assets/images/squat.gif';

    final deadlift = ExerciseModel()
      ..name = 'Deadlift'
      ..description =
          'A compound exercise for the back and legs using a barbell'
      ..equipment = ['Barbell']
      ..difficulty = 'Advanced'
      ..imageUrl = 'assets/images/deadlift.gif';

    final pullUp = ExerciseModel()
      ..name = 'Pull-up'
      ..description = 'A compound exercise for the back and biceps'
      ..equipment = ['Pull-up bar']
      ..difficulty = 'Intermediate'
      ..imageUrl = 'assets/images/pull-up.gif';

    // Link exercises to muscle groups
    chest.exercises.add(pushUp);
    chest.exercises.add(benchPress);
    legs.exercises.add(squat);
    back.exercises.add(deadlift);
    back.exercises.add(pullUp);
    biceps.exercises.add(pullUp);

    // Save data to the database
    await db.writeTxn(() async {
      // Save muscle groups
      await db.muscleGroupModels.putAll([chest, legs, back, biceps]);

      // Save exercises
      await db.exerciseModels
          .putAll([pushUp, benchPress, squat, deadlift, pullUp]);

      // Save relationships
      await chest.exercises.save();
      await legs.exercises.save();
      await back.exercises.save();
      await biceps.exercises.save();
    });
  }
}
