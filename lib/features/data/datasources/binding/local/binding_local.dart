import 'package:flutter_clean_achitecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_achitecture/features/common/constants/prefs_constant.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/binding/binding_datasource.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/binding/cache/shared_pref.dart';
import 'package:flutter_clean_achitecture/features/data/models/response/login_response.dart';
import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';

class BindingLocal implements BindingDataSource {
  BindingLocal(this.pref);

  final SharedPref? pref;

  @override
  Stream<String?> getPreferredLanguage() {
    throw UnimplementedError();
  }

  @override
  Stream<void> updatePreferredLanguage(String localeCode) {
    throw UnimplementedError();
  }

  @override
  Stream<bool> isAppFirstLaunch() async* {
    yield pref!.getBool(PrefsConstants.keyAppFirstLaunch) ?? true;
  }

  @override
  Stream<void> setAppFirstLaunch(bool isFirstLaunch) async* {
    yield pref!.putBool(PrefsConstants.keyAppFirstLaunch, isFirstLaunch);
  }

  @override
  Stream<bool> isLoggedIn() {
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, LoginResponse>> doLogin(LoginRequest request) {
    throw UnimplementedError();
  }
}
