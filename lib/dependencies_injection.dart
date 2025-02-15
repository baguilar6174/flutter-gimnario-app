import 'package:flutter_gimnario_app/utils/utils.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_gimnario_app/features/features.dart';
import 'package:isar/isar.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  await _initIsar();
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
}

Future<void> _initIsar() async {
  final isar = await IsarService.init();
  sl.registerSingleton<Isar>(isar);
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<ExercisesRepository>(
      () => ExercisesRepositoryImpl(sl<ExercisesDatasource>()));
}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<ExercisesDatasource>(
    () => IsarLocalDatasourceImpl(sl<Isar>()),
  );
}

void _useCase() {
  /// Exercises
  sl.registerLazySingleton(() => GetExercises(sl<ExercisesRepository>()));
  sl.registerLazySingleton(() => CreateSeed(sl<ExercisesRepository>()));
}

void _cubit() {
  /// Profile
  sl.registerFactory(() => ProfileCubit());

  /// Exercise
  sl.registerFactory(() => SeedCubit(sl<CreateSeed>()));
  sl.registerFactory(() => ExercisesCubit(sl<GetExercises>()));
}
