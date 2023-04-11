import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.message,
    this.errors,
  });

  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? message;
  final Errors? errors;

  @override
  List<Object> get props =>
      [accessToken!, tokenType!, expiresIn!, message!, errors!];
}

class Errors extends Equatable {
  const Errors({
    this.email,
  });

  final List<String>? email;

  @override
  List<Object?> get props => [email!];
}
