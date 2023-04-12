import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure({@required this.error});

  final dynamic error;

  @override
  List<Object> get props => [error];
}

class RequestFailure extends Failure {
  RequestFailure({
    @required this.code,
    @required this.message,
  });

  final int? code;
  final String? message;

  @override
  List<Object> get props => [code!, message!];
}

class CacheFailure extends Failure {
  final dynamic error;

  CacheFailure({@required this.error});

  @override
  List<Object> get props => [error];
}

class AnotherFailure extends Failure {
  final dynamic error;

  AnotherFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
