import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_achitecture/features/domain/entities/login/login_entity.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse extends LoginEntity {
  const LoginResponse({
    @required bool? status,
    @required LoginDataResponse? data,
  }) : super(
          status: status,
          data: data,
        );

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      data: json["data"] == null
          ? null
          : LoginDataResponse.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      "data": data,
    };
  }
}

class LoginDataResponse extends LoginDataEntity {
  const LoginDataResponse({
    @required String? accessToken,
    @required String? tokenType,
    @required int? expiresIn,
  }) : super(
          accessToken: accessToken,
          tokenType: tokenType,
          expiresIn: expiresIn,
        );

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) {
    return LoginDataResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
    };
  }
}
