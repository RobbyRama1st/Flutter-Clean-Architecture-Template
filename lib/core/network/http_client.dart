import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'package:flutter_clean_achitecture/core/env/config.dart';
import 'package:flutter_clean_achitecture/core/network/request_retrier.dart';
import 'package:flutter_clean_achitecture/features/common/constants/prefs_constant.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/binding/cache/shared_pref.dart';
import 'package:logger/logger.dart';

class HttpClient {
  HttpClient({required this.config, required this.pref});

  final logger = Logger();
  late Config config;
  late SharedPref pref;

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
      baseUrl: config.apiBaseUrl!,
      connectTimeout: Duration(milliseconds: 20000),
      receiveTimeout: Duration(milliseconds: 30000),
      receiveDataWhenStatusError: true,
      headers: {'isToken': pref.isKeyExists(PrefsConstants.keyAccessToken)},
    );
    final dynamic dio = Dio(options);
    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);
    dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: RequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
    );

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      final storageToken = pref.getString(PrefsConstants.keyAccessToken);

      logger.d("--> ${options.method} ${"${options.baseUrl}${options.path}"}");
      logger.d('Headers:');
      options.headers.forEach((k, v) => logger.d('$k: $v'));
      logger.d('queryParameters:');
      options.queryParameters.forEach((k, v) => logger.d('$k: $v'));
      logger.d(
        "--> END ${options.method}",
      );

      if (options.headers.containsKey('isToken')) {
        options.headers.remove('isToken');
        options.headers.addAll({'Authorization': 'Bearer $storageToken'});
      }

      // Do something before request is sent
      logger.d('\n'
          '-- headers --\n'
          '${options.headers.toString()} \n'
          '-- request --\n -->body'
          '${options.data} \n'
          '');

      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (response, handler) {
      // Do something with response data
      logger.d('\n'
          'Response : ${response.requestOptions.uri} \n'
          '-- headers --\n'
          '${response.headers.toString()} \n'
          '-- response --\n'
          '${jsonEncode(response.data)} \n'
          '');

      return handler.next(response); // continue
    }, onError: (DioError error, handler) {
      // Do something with response error
      return handler.next(error); //continue
    });
  }
}
