import 'package:isar/isar.dart';

import 'package:flutter_gimnario_app/features/exercises/data/models/models.dart';
import 'package:flutter_gimnario_app/features/exercises/domain/domain.dart';

part 'exercise_model.g.dart';

@Collection()
class ExerciseModel {
  Id id = Isar.autoIncrement; // Unique ID for Isar

  late String name;
  String? description;
  List<String>? equipment;
  late String difficulty;
  String? videoUrl;

  final muscleGroups = IsarLinks<MuscleGroupModel>(); // m:m

  // Convert ExerciseModel to Exercise entity
  Exercise toEntity() {
    return Exercise()
      ..name = name
      ..description = description
      ..equipment = equipment
      ..difficulty = difficulty
      ..videoUrl = videoUrl
      ..muscleGroups =
          muscleGroups.toList().map((mg) => mg.toEntity()).toList();
  }

  // Convert ExerciseModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'equipment': equipment,
      'difficulty': difficulty,
      'videoUrl': videoUrl,
      'muscleGroups': muscleGroups.map((mg) => mg.toJson()).toList(),
    };
  }
}
