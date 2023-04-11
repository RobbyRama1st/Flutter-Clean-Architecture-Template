import 'package:flutter_clean_achitecture/core/network/http_client.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/binding/binding_datasource.dart';
import 'package:flutter_clean_achitecture/features/domain/entities/login/login_entity.dart';
import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';

class BindingRemote implements BindingDataSource {
  BindingRemote(this.client);

  final HttpClient client;

  @override
  Stream<LoginEntity> doLogin(LoginRequest request) {
    throw UnimplementedError();
  }

  @override
  Stream<String?> getPreferredLanguage() {
    throw UnimplementedError();
  }

  @override
  Stream<bool> isAppFirstLaunch() {
    throw UnimplementedError();
  }

  @override
  Stream<bool> isLoggedIn() {
    throw UnimplementedError();
  }

  @override
  Stream<void> setAppFirstLaunch(bool isFirstLaunch) {
    throw UnimplementedError();
  }

  @override
  Stream<void> updatePreferredLanguage(String localeCode) {
    throw UnimplementedError();
  }
}
