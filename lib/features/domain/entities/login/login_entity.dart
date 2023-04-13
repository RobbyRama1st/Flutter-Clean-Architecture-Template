import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    this.status,
    this.data,
  }) : super();

  final bool? status;
  final LoginDataEntity? data;

  @override
  List<Object?> get props => [status!, data!];
}

class LoginDataEntity extends Equatable {
  const LoginDataEntity({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;

  @override
  List<Object> get props => [accessToken!, tokenType!, expiresIn!];
}
