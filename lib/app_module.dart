import 'package:flutter_modular/flutter_modular.dart';

import '../features/presentation/pages/auth/forgotPassword/forgot_password_page.dart';
import '../features/presentation/pages/auth/login/login_page.dart';
import '../features/presentation/pages/auth/register/register_page.dart';
import '../features/presentation/pages/auth/welcome/welcome_page.dart';
import '../features/presentation/pages/home/home_page.dart';
import '../features/presentation/pages/onBoarding/onboarding_page.dart';
import '../features/presentation/pages/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, __) => SplashPage(),
            transition: TransitionType.defaultTransition),
        ChildRoute('/onboarding', child: (_, __) => OnBoardingPage()),
        ChildRoute(
          '/home',
          child: (_, __) => HomePage(
            title: "Home",
          ),
        ),
        ChildRoute('/welcome', child: (_, __) => WelcomePage()),
        ChildRoute('/login', child: (_, __) => LoginPage()),
        ChildRoute('/forgot-password', child: (_, __) => ForgotPasswordPage()),
        ChildRoute('/register', child: (_, __) => RegisterPage()),
      ];
}
