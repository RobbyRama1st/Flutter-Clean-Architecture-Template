import 'package:dartz/dartz.dart';
import 'package:flutter_clean_achitecture/core/error/failure.dart';
import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';
import 'package:flutter_clean_achitecture/features/data/models/response/login_response.dart';

///declare [resource] datasource binding to [remote] and [local]
abstract class BindingDataSource {
  //language or localization
  Stream<String?> getPreferredLanguage();
  Stream<void> updatePreferredLanguage(String localeCode);

  ///[check] is app fisrt launch
  Stream<bool> isAppFirstLaunch();
  Stream<void> setAppFirstLaunch(bool isFirstLaunch);

  ///[check] is user already [login]
  Stream<bool> isLoggedIn();

  ///do sign in user
  Stream<Either<Failure, LoginResponse>> doLogin(LoginRequest request);
}
