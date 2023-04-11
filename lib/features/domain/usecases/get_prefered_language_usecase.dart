import 'package:dartz/dartz.dart';
import 'package:flutter_clean_achitecture/core/error/failure.dart';
import 'package:flutter_clean_achitecture/core/usecases/usecase.dart';
import 'package:flutter_clean_achitecture/features/domain/repositories/app_repository.dart';

class GetPreferredLanguageUseCase extends UseCase<String, NoParams> {
  GetPreferredLanguageUseCase(this.appRepository);

  final AppRepository appRepository;

  @override
  Stream<Either<Failure, String>> build(NoParams params) {
    return appRepository.getPreferredLanguage();
  }
}
