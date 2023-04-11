import 'package:flutter_clean_achitecture/core/env/config.dart';
import 'package:flutter_clean_achitecture/core/network/http_client.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/binding/cache/shared_pref.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/binding/local/binding_local.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/binding/remote/binding_remote.dart';
import 'package:flutter_clean_achitecture/features/data/datasources/datasource_factory.dart';
import 'package:flutter_clean_achitecture/features/data/repositories/app_repository_impl.dart';
import 'package:flutter_clean_achitecture/features/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_achitecture/features/domain/repositories/app_repository.dart';
import 'package:flutter_clean_achitecture/features/domain/repositories/user_repository.dart';
import 'package:flutter_clean_achitecture/features/domain/usecases/check_binding_status.dart';
import 'package:flutter_clean_achitecture/features/domain/usecases/get_prefered_language_usecase.dart';
import 'package:flutter_clean_achitecture/features/domain/usecases/login_usecase.dart';
import 'package:flutter_clean_achitecture/features/domain/usecases/update_language_usecase.dart';
import 'package:flutter_clean_achitecture/features/presentation/blocs/language-bloc/language_bloc.dart';
import 'package:flutter_clean_achitecture/features/presentation/blocs/login-bloc/login_bloc.dart';
import 'package:flutter_clean_achitecture/features/presentation/blocs/splash-bloc/splash_bloc.dart';
import 'package:get_it/get_it.dart';

///[NOTE] : input for [Global] data state
final sl = GetIt.instance;

Future<void> init() async {
  final config = Config.getInstance();
  final pref = await SharedPref.getInstance();

  /// [Flavor]
  /// [Implementation] flavor with different [Environm Env] both ios and android
  sl.registerLazySingleton(() => config);
  sl.registerLazySingleton(() => pref);

  ///network
  sl.registerLazySingleton(() => sl<HttpClient>().dio);
  sl.registerSingleton(HttpClient(config: sl(), pref: sl()));

  ///data [Binding] get data from local/remote
  sl.registerFactory(() => BindingLocal(sl()));
  sl.registerFactory(() => BindingRemote(sl()));

  ///[Core]
  ///
  ///sentry client
  ///
  ///[External]
  ///
  ///[Bloc]
  ///
  sl.registerFactory(() => SplashBloc());
  sl.registerFactory(() => LoginBloc());
  sl.registerFactory(
    () => LanguageBloc(),
  );

  ///[UseCase]
  ///
  sl.registerFactory(() => CheckBindStatusUsecase(sl()));
  sl.registerFactory(() => LoginUseCase(sl()));
  sl.registerFactory(() => GetPreferredLanguageUseCase(sl()));
  sl.registerFactory(() => UpdateLanguageUseCase(sl()));

  ///[Repository]
  ///
  sl.registerFactory<BindingDataSourceFactory>(
    () => BindingDataSourceFactory(bindingLocal: sl(), bindingRemote: sl()),
  );
  sl.registerFactory<UserRepository>(
    () => UserRepositoryImpl(bindingDataSourceFactory: sl()),
  );
  sl.registerFactory<AppRepository>(
    () => AppRepositoryImpl(bindingDataSourceFactory: sl()),
  );
}
