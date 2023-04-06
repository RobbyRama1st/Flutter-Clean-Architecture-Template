import 'package:flutter_clean_achitecture/presentation/pages/home/home_page.dart';
import 'package:flutter_clean_achitecture/presentation/pages/intro/onboarding_page.dart';
import 'package:flutter_clean_achitecture/presentation/pages/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => SplashPage(), transition: TransitionType.defaultTransition),
    ChildRoute('/intro', child: (_, __) => OnBoardingPage()),
    ChildRoute('/home', child: (_, __) => HomePage(title: "Home",)),
  ];
}
