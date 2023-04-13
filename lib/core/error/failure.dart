import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure({@required this.message});

  final dynamic message;

  @override
  List<Object> get props => [message];
}

class RequestFailure extends Failure {
  RequestFailure({
    @required this.message,
  });
  final dynamic message;

  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  final dynamic error;

  CacheFailure({@required this.error});

  @override
  List<Object> get props => [error];
}

class AnotherFailure extends Failure {
  final dynamic message;

  AnotherFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
