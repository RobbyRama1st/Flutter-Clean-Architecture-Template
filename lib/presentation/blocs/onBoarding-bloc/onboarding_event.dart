part of 'onboarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object> get props => [];
}

class SkipButtonPressed extends OnBoardingEvent {}

class PreviousButtonPressed extends OnBoardingEvent {}

class NextButtonPressed extends OnBoardingEvent {}

class GetStartedButtonPressed extends OnBoardingEvent {}
