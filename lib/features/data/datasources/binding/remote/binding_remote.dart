import 'package:dio/dio.dart';
import 'package:flutter_clean_achitecture/core/env/config.dart';
import 'package:flutter_clean_achitecture/core/network/http_client.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/binding/binding_datasource.dart';
import 'package:flutter_clean_achitecture/features/data/models/response/login_response.dart';
import 'package:flutter_clean_achitecture/features/domain/entities/login/login_entity.dart';
import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';
import 'package:flutter_clean_achitecture/main.dart';

class BindingRemote implements BindingDataSource {
  BindingRemote(this.client);

  final HttpClient client;
  late Config config;

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api3.julizar.com',
      // connectTimeout: 500 * 1000,
      // receiveTimeout: 500 * 1000,
    ),
  );

  @override
  Stream<LoginEntity> doLogin(LoginRequest request) async* {
    try {
      // Perform login request using HttpClient
      final response = await client.dio.post(
        "/v1/auth/login",
        data: request.toJson(),
      );

      // Check for successful response
      if (response.statusCode == 200) {
        // Parse the response data into LoginEntity object
        final data = LoginResponse.fromJson(response.data);

        logger.d("code 200");
        // Yield the loginEntity object
        yield data;
      } else if (response.statusCode == 422) {
        final data = LoginResponse.fromJson(response.data);

        logger.d("code 422");
        // Yield the loginEntity object
        yield data;
      } else {
        // Handle error response
        // You can throw an exception or yield an error LoginEntity object here
        // based on your requirement
        logger.d("code 422");
        yield LoginEntity(
          accessToken: null,
          tokenType: null,
          expiresIn: null,
          message: null,
          errors: null,
        );
      }
    } catch (error) {
      // Handle any exception that may occur during the login request
      // You can throw an exception or yield an error LoginEntity object here
      // based on your requirement
      logger.d('exception : ${error.toString()}');
      yield LoginResponse(
        accessToken: null,
        tokenType: null,
        expiresIn: null,
        message: null,
        errors: null,
      );
    }
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
