import 'package:dartz/dartz.dart';
import 'package:flutter_clean_achitecture/core/env/config.dart';
import 'package:flutter_clean_achitecture/core/error/failure.dart';
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

  @override
  Stream<Either<Failure, LoginEntity>> doLogin(LoginRequest request) async* {
    try {
      final response = await client.dio.post(
        '/v1/auth/login',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        logger.d("success 200");
        final data = LoginResponse.fromJson(response.data);
        // Create a LoginEntity object from the login response
        final loginEntity = LoginEntity(
          // Set the properties based on the response data
          accessToken: data.accessToken,
          tokenType: data.tokenType,
          expiresIn: data.expiresIn,
        );
        yield Right(loginEntity);
      } else if (response.statusCode == 422) {
        logger.d("failed 422");
        yield Left(
          RequestFailure(
            code: response.statusCode,
            message: response.data["message"] ?? "Email or password inccorrect",
          ),
        );
      } else {
        logger.d("failed 500");
        yield Left(
          ServerFailure(
            error: response.data["message"] ?? "Something when wrong!",
          ),
        );
      }
    } catch (error) {
      logger.d("Error cacth");
      yield Left(AnotherFailure(error: error.toString()));
    }
  }
}
