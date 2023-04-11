part of 'onboarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object> get props => [];
}

class OnBoardingPageChanged extends OnBoardingEvent {}

class SkipButtonPressed extends OnBoardingEvent {}

class GetStartedButtonPressed extends OnBoardingEvent {}
