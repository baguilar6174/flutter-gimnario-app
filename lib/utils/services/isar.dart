import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_gimnario_app/features/features.dart';

class IsarService {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ExerciseModelSchema, MuscleGroupModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return await Future.value(Isar.getInstance());
  }
}
