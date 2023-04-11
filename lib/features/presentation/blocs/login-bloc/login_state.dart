part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginEntity response;

  const LoginSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class LoginFailed extends LoginState {
  final String message;

  const LoginFailed(this.message);

  @override
  List<Object> get props => [message];
}
