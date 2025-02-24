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
  /// Exercises
  sl.registerLazySingleton<ExercisesRepository>(
    () => ExercisesRepositoryImpl(sl<ExercisesDatasource>()),
  );

  /// Workout
  sl.registerLazySingleton<WorkoutRepository>(
    () => WorkoutRepositoryImpl(sl<WorkoutDatasource>()),
  );
}

/// Register dataSources
void _dataSources() {
  /// Exercises
  sl.registerLazySingleton<ExercisesDatasource>(
    () => IsarLocalExercisesDatasourceImpl(sl<Isar>()),
  );

  /// Workout
  sl.registerLazySingleton<WorkoutDatasource>(
    () => IsarLocalWorkoutDatasourceImpl(sl<Isar>()),
  );
}

void _useCase() {
  /// Exercises
  sl.registerLazySingleton(() => GetExercises(sl<ExercisesRepository>()));
  sl.registerLazySingleton(() => CreateSeed(sl<ExercisesRepository>()));

  /// Workout
  sl.registerLazySingleton(() => GetWorkouts(sl<WorkoutRepository>()));
  sl.registerLazySingleton(() => CreateWorkout(sl<WorkoutRepository>()));
}

void _cubit() {
  /// Profile
  sl.registerFactory(() => ProfileCubit());

  /// Exercise
  sl.registerFactory(() => SeedCubit(sl<CreateSeed>()));
  sl.registerFactory(() => ExercisesCubit(sl<GetExercises>()));

  /// Workout
  sl.registerFactory(
    () => WorkoutCubit(
      getWorkouts: sl<GetWorkouts>(),
      createWorkout: sl<CreateWorkout>(),
    ),
  );
}
