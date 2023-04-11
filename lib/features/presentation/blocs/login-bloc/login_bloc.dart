import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';
import 'package:flutter_clean_achitecture/features/domain/usecases/login_usecase.dart';

import '../../../../core/error/failure.dart';
import '../../../../main.dart';
import '../../../domain/entities/login/login_entity.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is MakeLoginRequest) {
        // Emit LoginLoading state to indicate that the login request is in progress
        emit(LoginLoading());

        // Handle the result from the LoginUseCase
        emit.forEach(
          loginUseCase.execute(event.request!),
          onData: (Either<Failure, LoginEntity> eventRes) {
            return eventRes.fold(
              (failure) {
                logger.d("failure ");
                RequestFailure f = failure as RequestFailure;
                return LoginFailed(f.message);
              },
              (values) {
                logger.d("success ");
                return LoginSuccess(values);
              },
            );
          },
        );
      }
    });
  }
}
