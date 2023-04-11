import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';
import 'package:flutter_clean_achitecture/features/domain/entities/login/login_entity.dart';

///declare [resource] datasource binding to [remote] and [local]
abstract class BindingDataSource {
  //language or localization
  Stream<String?> getPreferredLanguage();
  Stream<void> updatePreferredLanguage(String localeCode);

  ///[check] is app fisrt launch
  Stream<bool> isAppFirstLaunch();

  ///[check] is user already [login]
  Stream<bool> isLoggedIn();

  ///do sign in user
  Stream<LoginEntity> doLogin(LoginRequest request);
}
