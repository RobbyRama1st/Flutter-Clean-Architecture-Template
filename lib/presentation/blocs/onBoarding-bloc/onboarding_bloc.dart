import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_achitecture/data/models/onboarding_item.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final List<OnBoardingItem> onboardingItems;
  OnBoardingBloc({required this.onboardingItems}) : super(OnBoardingInitial()) {
    on<OnBoardingEvent>((event, emit) {
      int currentPageIndex = 0;

      if (event is OnBoardingPageIndex) {
        emit(OnBoardingPageChangedState(pageIndex: currentPageIndex));
      }

      if (event is SkipButtonPressed) {
        emit(OnBoardingCompletedState());
      }

      if (event is PreviousButtonPressed) {
        if (currentPageIndex > 0) {
          currentPageIndex--;
          emit(OnBoardingPageChangedState(pageIndex: currentPageIndex));
        }
      }

      if (event is NextButtonPressed) {
        if (currentPageIndex < onboardingItems.length - 1) {
          currentPageIndex++;
          emit(OnBoardingPageChangedState(pageIndex: currentPageIndex));
        }
      }

      if (event is GetStartedButtonPressed) {
        emit(OnBoardingCompletedState());
      }
    });
  }
}
