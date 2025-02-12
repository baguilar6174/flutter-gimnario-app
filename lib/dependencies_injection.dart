import 'package:get_it/get_it.dart';

import 'package:flutter_gimnario_app/features/features.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<ExercisesRepository>(
      () => ExercisesRepositoryImpl(sl()));
}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<ExercisesDatasource>(
    () => IsarLocalDatasourceImpl(),
  );
}

void _useCase() {
  /// Exercises
  sl.registerLazySingleton(() => GetExercises(sl()));
}

void _cubit() {
  /// Profile
  sl.registerFactory(() => ProfileCubit());

  /// Exercise
  sl.registerFactory(() => ExercisesCubit(sl()));
}
