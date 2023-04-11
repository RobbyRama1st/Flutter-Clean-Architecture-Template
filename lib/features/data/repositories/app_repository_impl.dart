import 'package:dartz/dartz.dart';
import 'package:flutter_clean_achitecture/core/error/failure.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/datasource_factory.dart';
import 'package:flutter_clean_achitecture/features/domain/repositories/app_repository.dart';

import '../../di/injection_container.dart';
import '../datasources/binding/cache/shared_pref.dart';
import '../datasources/common/base_datasource_factory.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl({
    required BindingDataSourceFactory? bindingDataSourceFactory,
  }) : _bindingDataSourceFactory = bindingDataSourceFactory;

  final BindingDataSourceFactory? _bindingDataSourceFactory;

  final pref = sl<SharedPref>();

  @override
  Stream<Either<Failure, String>> getPreferredLanguage() {
    return _bindingDataSourceFactory!
        .createData(DataSourceState.local)!
        .getPreferredLanguage()
        .map((event) => Right(event!));
  }

  @override
  Stream<Either<Failure, void>> updatePreferredLanguage(String code) {
    return _bindingDataSourceFactory!
        .createData(DataSourceState.local)!
        .updatePreferredLanguage(code)
        .map((event) => Right(event));
  }
}
