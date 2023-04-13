import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
  Stream<Either<Failure, LoginResponse>> doLogin(LoginRequest request) async* {
    try {
      final response = await client.dio.post(
        '/v1/auth/login',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        logger.d(
            "REMOTE DATASOURCE: SUCCESS WITH STATUS CODE ${response.statusCode}");

        final data = loginResponseFromJson(json.encode(response.data));
        // Create a LoginEntity object from the login response
        logger.d("REMOTE DATASOURCE: SUCCESS ACCESS TOKEN ${data.accessToken}");

        yield Right(data);
      } else if (response.statusCode == 422) {
        logger.d(
            "REMOTE DATASOURCE: FAILED WITH STATUS CODE ${response.statusCode}");
        yield Left(
          RequestFailure(
            message: response.data["message"] ?? "Email or password inccorrect",
          ),
        );
      } else {
        yield Left(
          ServerFailure(
            message: response.data["message"] ?? "Something when wrong!",
          ),
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        logger.d('Dio error!');
        logger.d('STATUS: ${e.response?.statusCode}');
        logger.d('DATA: ${e.response?.data}');
        logger.d('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        logger.d('Error sending request!');
        logger.d(e.message);
      }
    }
  }
}
