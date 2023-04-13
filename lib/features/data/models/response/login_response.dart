import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_achitecture/features/domain/entities/login/login_entity.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse extends LoginEntity {
  const LoginResponse({
    @required String? accessToken,
    @required String? tokenType,
    @required int? expiresIn,
    @required String? message,
    @required Errors? errors,
  }) : super(
          accessToken: accessToken,
          tokenType: tokenType,
          expiresIn: expiresIn,
          message: message,
        );

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      message: json['message'],
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'message': message,
      'errors': errors,
    };
  }
}
