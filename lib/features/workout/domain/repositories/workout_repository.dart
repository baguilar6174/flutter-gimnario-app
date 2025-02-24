import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/features/workout/domain/domain.dart';
import 'package:flutter_gimnario_app/core/core.dart';

abstract interface class WorkoutRepository {
  Future<Either<Failure, List<Workout>>> workouts();
  Future<Either<Failure, Unit>> create();
}
