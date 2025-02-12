import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/core/error/failure.dart';
import 'package:flutter_gimnario_app/features/excercise/domain/domain.dart';

class ExcercisesRepositoryImpl implements ExcercisesRepository {
  final ExcercisesDatasource datasource;

  const ExcercisesRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Exercise>>> exercises() async {
    final response = await datasource.exercises();
    return response.fold(
      (failure) => Left(failure),
      (exercisesResponse) {
        if (exercisesResponse.isEmpty) return Left(NoDataFailure());
        return Right(exercisesResponse);
      },
    );
  }

  @override
  Future<Either<Failure, List<MuscleGroup>>> muscleGroups() async {
    final response = await datasource.muscleGroups();
    return response.fold(
      (failure) => Left(failure),
      (muscleGroupsResponse) {
        if (muscleGroupsResponse.isEmpty) return Left(NoDataFailure());
        return Right(muscleGroupsResponse);
      },
    );
  }
}
