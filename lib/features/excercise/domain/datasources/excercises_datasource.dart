import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/features/excercise/domain/domain.dart';
import 'package:flutter_gimnario_app/core/core.dart';

abstract interface class ExcercisesDatasource {
  Future<Either<Failure, List<Exercise>>> exercises();
  Future<Either<Failure, List<MuscleGroup>>> muscleGroups();
}
