import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/exercises/exercises.dart';

class IsarLocalDatasourceImpl implements ExercisesDatasource {
  late Future<Isar> db;

  IsarLocalDatasourceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return Isar.open(
        [ExerciseModelSchema, MuscleGroupModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<Either<Failure, List<ExerciseModel>>> exercises() async {
    try {
      final isar = await db;
      final response = await isar.exerciseModels.where().findAll();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MuscleGroupModel>>> muscleGroups() async {
    try {
      final isar = await db;
      final response = await isar.muscleGroupModels.where().findAll();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
