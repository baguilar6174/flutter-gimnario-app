import 'package:flutter_gimnario_app/core/error/failure.dart';
import 'package:flutter_gimnario_app/features/excercise/data/datasources/datasources.dart';
import 'package:flutter_gimnario_app/features/excercise/domain/domain.dart';

import 'package:fpdart/fpdart.dart';

class ExcercisesRepositoryImpl implements ExcercisesRepository {
  final ExcerciseLocalDatasource datasource;

  const ExcercisesRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Exercise>>> exercises() {
    return datasource.exercises();
  }

  @override
  Future<Either<Failure, List<MuscleGroup>>> muscleGroups() {
    return datasource.muscleGroups();
  }
}
