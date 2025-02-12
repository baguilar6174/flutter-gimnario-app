import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/features/exercises/domain/domain.dart';

part 'muscle_group_model.g.dart';

@Collection()
class MuscleGroupModel extends MuscleGroup {
  Id id = Isar.autoIncrement;
}
