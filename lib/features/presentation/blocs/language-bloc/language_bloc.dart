import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_achitecture/features/domain/usecases/get_prefered_language_usecase.dart';
import 'package:flutter_clean_achitecture/features/domain/usecases/update_language_usecase.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguageUseCase getPreferredLanguageUseCase;
  final UpdateLanguageUseCase updateLanguageUseCase;
  LanguageBloc({
    required this.getPreferredLanguageUseCase,
    required this.updateLanguageUseCase,
  }) : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) {
      // Belum
    });
  }
}
