import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
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
