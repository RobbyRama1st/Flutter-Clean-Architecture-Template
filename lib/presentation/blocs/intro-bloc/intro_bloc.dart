import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_achitecture/data/models/onboarding_item.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final List<OnBoardingItem> onboardingItems;
  IntroBloc({required this.onboardingItems}) : super(IntroInitial()) {
    on<IntroEvent>((event, emit) {
      int currentPageIndex = 0;

      if (event is SkipButtonPressed) {
        emit(IntroCompletedState());
      }

      if (event is PreviousButtonPressed) {
        if (currentPageIndex > 0) {
          currentPageIndex--;
          emit(IntroPageChangedState(pageIndex: currentPageIndex));
        }
      }

      if (event is NextButtonPressed) {
        if (currentPageIndex < onboardingItems.length - 1) {
          currentPageIndex++;
          emit(IntroPageChangedState(pageIndex: currentPageIndex));
        }
      }

      if (event is GetStartedButtonPressed) {
        emit(IntroCompletedState());
      }
    });
  }
}
