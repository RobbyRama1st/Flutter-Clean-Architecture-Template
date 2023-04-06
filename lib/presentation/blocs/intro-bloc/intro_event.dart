part of 'intro_bloc.dart';

abstract class IntroEvent extends Equatable {
  const IntroEvent();

  @override
  List<Object> get props => [];
}

class SkipButtonPressed extends IntroEvent {}

class PreviousButtonPressed extends IntroEvent {}

class NextButtonPressed extends IntroEvent {}

class GetStartedButtonPressed extends IntroEvent {}
