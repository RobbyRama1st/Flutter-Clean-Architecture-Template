part of 'onboarding_bloc.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingPageChangedState extends OnBoardingState {}

class OnBoardingCompletedState extends OnBoardingState {}
