import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_achitecture/presentation/blocs/splash-bloc/splash_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var logger = Logger();
  final _splashBloc = SplashBloc();

  @override
  void initState() {
    super.initState();
    _splashBloc.add(SplashScreenStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return _splashBloc;
      },
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoading) {
            logger.d("onSplashLoading");
          }

          if (state is SplashFailed) {
            logger.d("onSplashLoaded");
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }

          if (state is SplashSuccess) {
            logger.d("onSplashSuccess");
            Modular.to.navigate('/onboarding');
          }
        },
        child: Scaffold(
          body: Center(
            child: Text("Splash Page"),
          ),
        ),
      ),
    );
  }
}
