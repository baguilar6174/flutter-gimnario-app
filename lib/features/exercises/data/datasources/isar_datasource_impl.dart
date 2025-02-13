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
}
