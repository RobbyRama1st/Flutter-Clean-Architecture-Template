part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageLoaded extends LanguageState {
  const LanguageLoaded(this.locale);

  final Locale locale;

  @override
  List<Object> get props => [locale.languageCode];
}

class LanguageError extends LanguageState {
  const LanguageError(this.message);

  final String message;
}
