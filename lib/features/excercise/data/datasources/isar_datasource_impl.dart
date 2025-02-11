import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/features/excercise/data/datasources/local_datasource.dart';
import 'package:flutter_gimnario_app/features/excercise/domain/domain.dart';
import 'package:flutter_gimnario_app/core/core.dart';

class IsarLocalDatasourceImpl implements ExcerciseLocalDatasource {
  late Future<Isar> db;

  IsarLocalDatasourceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return Isar.open(
        [ExerciseSchema, MuscleGroupSchema],
        inspector: true,
        directory: "", // TODO: change to dir.path
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<Either<Failure, List<Exercise>>> exercises() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MuscleGroup>>> muscleGroups() async {
    throw UnimplementedError();
  }
}
