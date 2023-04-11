import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_achitecture/features/domain/entities/login/login_entity.dart';

class LoginResponse extends LoginEntity {
  const LoginResponse({
    @required String? accessToken,
    @required String? tokenType,
    @required int? expiresIn,
  }) : super(
          accessToken: accessToken,
          tokenType: tokenType,
          expiresIn: expiresIn,
        );

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
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
