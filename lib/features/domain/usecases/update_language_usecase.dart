import 'package:dartz/dartz.dart';
import 'package:flutter_clean_achitecture/core/error/failure.dart';
import 'package:flutter_clean_achitecture/core/usecases/usecase.dart';
import 'package:flutter_clean_achitecture/features/domain/repositories/app_repository.dart';

class UpdateLanguageUseCase extends UseCase<void, String> {
  UpdateLanguageUseCase(this.appRepository);

  final AppRepository appRepository;
  @override
  Stream<Either<Failure, void>> build(String params) {
    return appRepository.updatePreferredLanguage(params);
  }
}
