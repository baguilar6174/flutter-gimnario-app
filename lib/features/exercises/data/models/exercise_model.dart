import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/features/exercises/data/models/models.dart';
import 'package:flutter_gimnario_app/features/exercises/domain/domain.dart';

part 'exercise_model.g.dart';

@Collection()
class ExerciseModel extends Exercise {
  Id id = Isar.autoIncrement;
  final muscleGroups = IsarLinks<MuscleGroupModel>(); // Many-to-many relation
}
