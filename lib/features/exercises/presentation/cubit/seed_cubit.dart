import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';

class SeedCubit extends Cubit<bool> {
  final CreateSeed _createSeed;

  SeedCubit(this._createSeed) : super(false);

  Future<void> createSeed() async {
    final hasRunSeed = true;

    // ignore: dead_code
    if (!hasRunSeed) {
      await _createSeed.call(NoParams());
    }

    // TODO: Remove this when use shared preferences
    await Future.delayed(const Duration(milliseconds: 500));

    emit(true);
  }
}
