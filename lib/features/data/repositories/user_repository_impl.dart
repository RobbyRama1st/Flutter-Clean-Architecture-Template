import 'package:dartz/dartz.dart';
import 'package:flutter_clean_achitecture/core/error/failure.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/datasource_factory.dart';
import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';
import 'package:flutter_clean_achitecture/features/data/models/response/login_response.dart';
import 'package:flutter_clean_achitecture/features/domain/repositories/user_repository.dart';

import '../../../main.dart';
import '../datasources/common/base_datasource_factory.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required BindingDataSourceFactory? bindingDataSourceFactory,
  }) : _bindingDataSourceFactory = bindingDataSourceFactory;

  final BindingDataSourceFactory? _bindingDataSourceFactory;

  @override
  Stream<Either<Failure, bool>> checkBindStatus() {
    return _bindingDataSourceFactory!
        .createData(DataSourceState.local)!
        .isLoggedIn()
        .map((event) => Right(event));
  }

  @override
  Stream<Either<Failure, LoginResponse>> doLogin(LoginRequest body) {
    return _bindingDataSourceFactory!
        .createData(DataSourceState.network)!
        .doLogin(body)
        .map((event) {
      return event.fold((failure) {
        return Left(failure);
      }, (success) {
        return Right(success);
      });
    });
  }
}
