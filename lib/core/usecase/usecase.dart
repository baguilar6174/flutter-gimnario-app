import 'package:fpdart/fpdart.dart';

import 'package:flutter_gimnario_app/core/core.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

/// Class to handle when useCase don't need params
class NoParams {}
