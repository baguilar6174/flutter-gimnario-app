import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/exercises/domain/domain.dart';

class CreateSeed implements UseCase<Unit, NoParams> {
  final ExercisesRepository _repo;

  const CreateSeed(this._repo);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await _repo.createSeed();
  }
}
