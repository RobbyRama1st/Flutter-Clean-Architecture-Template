import 'package:dartz/dartz.dart';
import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';
import 'package:flutter_clean_achitecture/features/domain/entities/login/login_entity.dart';
import 'package:flutter_clean_achitecture/features/domain/repositories/user_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';

class LoginUseCase extends UseCase<LoginEntity, LoginRequest> {
  LoginUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Stream<Either<Failure, LoginEntity>> build(LoginRequest params) {
    return _userRepository.doLogin(params);
  }
}
