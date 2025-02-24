import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/core/error/failure.dart';
import 'package:flutter_gimnario_app/features/workout/domain/domain.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  final WorkoutDatasource datasource;

  const WorkoutRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Unit>> create() async {
    return await datasource.create();
  }

  @override
  Future<Either<Failure, List<Workout>>> workouts() async {
    final response = await datasource.workouts();
    return response.fold(
      (failure) => Left(failure),
      (workoutResponse) {
        if (workoutResponse.isEmpty) return Left(NoDataFailure());
        return Right(workoutResponse);
      },
    );
  }
}
