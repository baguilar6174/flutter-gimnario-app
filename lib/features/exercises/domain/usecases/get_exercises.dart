import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/exercises/domain/domain.dart';

class GetExercises implements UseCase<List<Exercise>, NoParams> {
  final ExercisesRepository _repo;

  const GetExercises(this._repo);

  @override
  Future<Either<Failure, List<Exercise>>> call(NoParams params) async {
    return await _repo.exercises();
  }
}
