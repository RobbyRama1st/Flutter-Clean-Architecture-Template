import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_achitecture/main.dart';
import 'package:rxdart/rxdart.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Stream<Either<Failure, Type>> build(Params params);

  Stream<Either<Failure, Type>> execute(Params params) {
    return build(params).onErrorResume((error, stackTrace) {
      logger.d('Error-streams      : $error');
      logger.d('StackTrace-streams : $stackTrace');
      Failure failure;

      if (error is Failure) {
        failure = error;
      } else if (error is RequestFailure) {
        failure = RequestFailure(message: '$error.message');
      } else if (error is ServerFailure) {
        failure = ServerFailure(message: '$error.message');
      } else {
        failure = AnotherFailure(message: '$error');
      }

      ///[return error value]
      ///if stream getting error will return left option on Either
      return Stream.value(Left(failure));
    });
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
