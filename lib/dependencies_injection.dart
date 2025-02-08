import 'package:flutter_gimnario_app/features/profile/profile.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  _cubit();
}

void _cubit() {
  /// Profile
  sl.registerFactory(() => ProfileCubit());
}
