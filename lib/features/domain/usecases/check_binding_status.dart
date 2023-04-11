import 'package:dartz/dartz.dart';
import 'package:flutter_clean_achitecture/features/domain/repositories/user_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';

class CheckBindStatusUsecase extends UseCase<bool, NoParams> {
  CheckBindStatusUsecase(this._userRepository) {
    print('create checkBinding status');
  }

  final UserRepository _userRepository;

  @override
  Stream<Either<Failure, bool>> build(NoParams params) {
    print('build checkBindingStatus');
    return _userRepository.checkBindStatus();
  }
}
