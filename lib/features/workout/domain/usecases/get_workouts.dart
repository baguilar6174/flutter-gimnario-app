import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/workout/domain/domain.dart';

class GetWorkouts implements UseCase<List<Workout>, NoParams> {
  final WorkoutRepository _repo;

  const GetWorkouts(this._repo);

  @override
  Future<Either<Failure, List<Workout>>> call(NoParams params) async {
    return await _repo.workouts();
  }
}
