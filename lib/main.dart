import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_achitecture/app_module.dart';
import 'package:flutter_clean_achitecture/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import 'core/env/config.dart';
import 'core/env/flavor.dart';
import 'features/di/injection_container.dart' as di;

///logger
var logger = Logger();

///[get debug mode]
bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<void> main() async {
  /// [Catch some error]
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (!kReleaseMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  /// [run apps] with catch error
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await getFlavorSetting();
    await di.init();
    // await disableLendscapeMode(); /// [deprecated]
    disableErrorWidget();

    runApp(ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ));

    ///[console] flavor running hidden when release mode
    if (!kReleaseMode) {
      final settings = Config.getInstance();
      logger.d('🚀 APP FLAVOR NAME      : ${settings.flavorName}');
      logger.d('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}');
      logger.d('🚀 APP API_SENTRY       : ${settings.apiSentry}');
    }
  }, (error, stackTrace) {
    logger.e('❎ ERROR   :$error');
    logger.e('❎ STACKTRACE    :$stackTrace');
  });
}

/// [disable error] widget when [release mode]
void disableErrorWidget() {
  if (kReleaseMode) {
    ErrorWidget.builder = (details) {
      logger.d('Error widget trigerred on :${details.exception}');
      logger.d(details.stack.toString());
      return const Center(
        child: Text('Something Goes Wrong, Please chek your debug console'),
      );
    };
  }
}

/// [disable landscape] model [deprecated] already move to runZoned
// Future<void> disableLandscapeMode() async {
//   await SystemChrome.setPreferredOrientations(([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]));
// }

///[environment] configuration
Future<FlavorSettings> getFlavorSetting() async {
  final flavor =
      await const MethodChannel('flavor').invokeMethod<String>('getFlavor');

  if (flavor == 'development') {
    return FlavorSettings.development();
  } else if (flavor == 'staging') {
    return FlavorSettings.staging();
  } else if (flavor == 'production') {
    return FlavorSettings.production();
  } else {
    throw Exception('Oopss... Flavor name missing');
  }
}
