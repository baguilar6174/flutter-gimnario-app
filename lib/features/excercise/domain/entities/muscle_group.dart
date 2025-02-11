import 'package:isar/isar.dart';

part 'muscle_group.g.dart';

@Collection()
class MuscleGroup {
  Id id = Isar.autoIncrement;
  late String name;
  String? description;
  int? parentId;
}
