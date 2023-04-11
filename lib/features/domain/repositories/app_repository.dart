import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class AppRepository {
  Stream<Either<Failure, String>> getPreferredLanguage();

  Stream<Either<Failure, void>> updatePreferredLanguage(String code);
}
