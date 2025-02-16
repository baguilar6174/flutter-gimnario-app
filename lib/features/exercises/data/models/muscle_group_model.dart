import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/features/exercises/data/models/exercise_model.dart';
import 'package:flutter_gimnario_app/features/exercises/domain/domain.dart';

part 'muscle_group_model.g.dart';

@Collection()
class MuscleGroupModel {
  Id id = Isar.autoIncrement; // Unique ID for Isar

  late String name;
  String? description;
  int? parentId;

  @Backlink(to: 'muscleGroups')
  final exercises = IsarLinks<ExerciseModel>();

  // Convert MuscleGroupModel to MuscleGroup entity
  MuscleGroup toEntity() {
    return MuscleGroup()
      ..name = name
      ..description = description
      ..parentId = parentId;
  }

  // Convert MuscleGroupModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'parentId': parentId,
    };
  }
}
