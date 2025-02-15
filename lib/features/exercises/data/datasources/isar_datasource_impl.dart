import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/exercises/exercises.dart';

class IsarLocalDatasourceImpl implements ExercisesDatasource {
  final Isar db;

  const IsarLocalDatasourceImpl(this.db);

  @override
  Future<Either<Failure, List<ExerciseModel>>> exercises() async {
    try {
      final response = await db.exerciseModels.where().findAll();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MuscleGroupModel>>> muscleGroups() async {
    try {
      final response = await db.muscleGroupModels.where().findAll();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> createSeed() async {
    try {
      await seedMuscleGroups();
      await seedExercises();
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> seedMuscleGroups() async {
    final muscleGroups = [
      MuscleGroupModel()
        ..name = "Chest"
        ..description = "Pectoral muscles",
      MuscleGroupModel()
        ..name = "Back"
        ..description = "Upper and lower back muscles",
      MuscleGroupModel()
        ..name = "Shoulders"
        ..description = "Deltoid muscles",
      MuscleGroupModel()
        ..name = "Biceps"
        ..description = "Front of upper arm",
      MuscleGroupModel()
        ..name = "Triceps"
        ..description = "Back of upper arm",
      MuscleGroupModel()
        ..name = "Legs"
        ..description = "Quadriceps, hamstrings, calves",
      MuscleGroupModel()
        ..name = "Core"
        ..description = "Abdominals and obliques",
    ];

    await db.writeTxn(() async {
      await db.muscleGroupModels.putAll(muscleGroups);
    });
  }

  Future<void> seedExercises() async {
    final chest =
        await db.muscleGroupModels.filter().nameEqualTo("Chest").findFirst();
    final back =
        await db.muscleGroupModels.filter().nameEqualTo("Back").findFirst();
    final shoulders = await db.muscleGroupModels
        .filter()
        .nameEqualTo("Shoulders")
        .findFirst();
    final biceps =
        await db.muscleGroupModels.filter().nameEqualTo("Biceps").findFirst();
    final triceps =
        await db.muscleGroupModels.filter().nameEqualTo("Triceps").findFirst();
    final legs =
        await db.muscleGroupModels.filter().nameEqualTo("Legs").findFirst();
    final core =
        await db.muscleGroupModels.filter().nameEqualTo("Core").findFirst();

    if (chest == null ||
        back == null ||
        shoulders == null ||
        biceps == null ||
        triceps == null ||
        legs == null ||
        core == null) {
      return;
    }

    final exercises = [
      ExerciseModel()
        ..name = "Bench Press"
        ..description = "A compound exercise that targets the chest."
        ..equipment = ["Barbell", "Bench"]
        ..difficulty = "Intermediate"
        ..videoUrl = "example"
        ..muscleGroups.add(chest),
      ExerciseModel()
        ..name = "Pull-Up"
        ..description =
            "A bodyweight exercise that targets the back and biceps."
        ..equipment = ["Pull-Up Bar"]
        ..difficulty = "Advanced"
        ..videoUrl = "example"
        ..muscleGroups.addAll([back, biceps]),
      ExerciseModel()
        ..name = "Shoulder Press"
        ..description = "An overhead pressing movement for shoulders."
        ..equipment = ["Dumbbells"]
        ..difficulty = "Intermediate"
        ..videoUrl = "example"
        ..muscleGroups.add(shoulders),
      ExerciseModel()
        ..name = "Squat"
        ..description = "A lower-body exercise that targets the legs."
        ..equipment = ["Barbell"]
        ..difficulty = "Intermediate"
        ..videoUrl = "example"
        ..muscleGroups.add(legs),
      ExerciseModel()
        ..name = "Plank"
        ..description = "An isometric core exercise for stability."
        ..equipment = ["None"]
        ..difficulty = "Beginner"
        ..videoUrl = "example"
        ..muscleGroups.add(core),
    ];

    await db.writeTxn(() async {
      await db.exerciseModels.putAll(exercises);
    });
  }
}
