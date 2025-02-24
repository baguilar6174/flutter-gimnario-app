import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/workout/domain/domain.dart';

class CreateWorkout implements UseCase<Unit, NoParams> {
  final WorkoutRepository _repo;

  const CreateWorkout(this._repo);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await _repo.create();
  }
}
