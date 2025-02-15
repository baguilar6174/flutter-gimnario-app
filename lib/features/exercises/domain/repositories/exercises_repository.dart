import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/features/exercises/domain/domain.dart';
import 'package:flutter_gimnario_app/core/core.dart';

abstract interface class ExercisesRepository {
  Future<Either<Failure, List<Exercise>>> exercises();
  Future<Either<Failure, List<MuscleGroup>>> muscleGroups();
  Future<Either<Failure, Unit>> createSeed();
}
