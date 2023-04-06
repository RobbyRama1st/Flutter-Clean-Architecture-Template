part of 'intro_bloc.dart';

abstract class IntroState extends Equatable {
  const IntroState();

  @override
  List<Object> get props => [];
}

class IntroInitial extends IntroState {}

class IntroPageChangedState extends IntroState {
  final int pageIndex;

  const IntroPageChangedState({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}

class IntroCompletedState extends IntroState {}
