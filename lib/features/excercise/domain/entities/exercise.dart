import 'package:isar/isar.dart';
import 'muscle_group.dart';

part 'exercise.g.dart';

@Collection()
class Exercise {
  Id id = Isar.autoIncrement;
  late String name;
  String? description;
  List<String>? equipment;
  late String difficulty;
  String? videoUrl;

  final muscleGroups = IsarLinks<MuscleGroup>(); // Many-to-many relation
}
