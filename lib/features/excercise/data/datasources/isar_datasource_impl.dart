import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_gimnario_app/features/excercise/domain/domain.dart';
import 'package:flutter_gimnario_app/core/core.dart';

class IsarLocalDatasourceImpl implements ExcercisesDatasource {
  late Future<Isar> db;

  IsarLocalDatasourceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return Isar.open(
        [ExerciseSchema, MuscleGroupSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<Either<Failure, List<Exercise>>> exercises() async {
    try {
      final isar = await db;
      final response = await isar.exercises.where().findAll();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MuscleGroup>>> muscleGroups() async {
    try {
      final isar = await db;
      final response = await isar.muscleGroups.where().findAll();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
