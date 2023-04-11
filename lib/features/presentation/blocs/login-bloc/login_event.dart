part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class MakeLoginRequest extends LoginEvent {
  final LoginRequest? request;

  const MakeLoginRequest(this.request);

  @override
  List<Object> get props => [request!];
}
