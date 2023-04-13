import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';
import 'package:flutter_clean_achitecture/features/data/models/response/login_response.dart';
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
        logger.d("BLOC nih");
        // Emit LoginLoading state to indicate that the login request is in progress
        emit(LoginLoading());

        // Handle the result from the LoginUseCase
        await emit.forEach(
          loginUseCase.execute(event.request!),
          onData: (Either<Failure, LoginResponse> response) {
            String? message;
            return response.fold(
              (failure) {
                logger.d("bloc fail ");
                if (failure is RequestFailure) {
                  message = failure.message;
                }
                if (failure is ServerFailure) {
                  message = failure.message;
                }
                return LoginFailed(message ?? failure.toString());
              },
              (success) {
                logger.d("bloc success: token ${success.accessToken}");
                return LoginSuccess(success);
              },
            );
          },
          onError: (error, stackTrace) {
            logger.d(error.toString());
            return LoginFailed(error.toString());
          },
        );
      }
    });
  }
}
