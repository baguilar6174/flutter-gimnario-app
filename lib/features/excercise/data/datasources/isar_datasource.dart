import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/features/excercise/data/datasources/local_datasource.dart';
import 'package:flutter_gimnario_app/features/excercise/domain/domain.dart';
import 'package:flutter_gimnario_app/core/core.dart';

class IsarLocalDatasourceImpl implements ExcerciseLocalDatasource {
  @override
  Future<Either<Failure, List<Exercise>>> exercises() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MuscleGroup>>> muscleGroups() async {
    throw UnimplementedError();
  }
}
