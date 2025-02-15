import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/core/error/failure.dart';
import 'package:flutter_gimnario_app/features/exercises/domain/domain.dart';

class ExercisesRepositoryImpl implements ExercisesRepository {
  final ExercisesDatasource datasource;

  const ExercisesRepositoryImpl(this.datasource);

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

  @override
  Future<Either<Failure, Unit>> createSeed() async {
    return await datasource.createSeed();
  }
}
