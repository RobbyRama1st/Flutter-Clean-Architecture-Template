import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<OnBoardingEvent>((event, emit) {
      if (event is OnBoardingPageChanged) {
        emit(OnBoardingPageChangedState());
      }

      if (event is SkipButtonPressed) {
        emit(OnBoardingCompletedState());
      }

      if (event is GetStartedButtonPressed) {
        emit(OnBoardingCompletedState());
      }
    });
  }
}
