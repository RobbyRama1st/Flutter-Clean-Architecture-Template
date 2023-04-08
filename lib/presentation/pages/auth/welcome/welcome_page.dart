import 'package:flutter/material.dart';
import 'package:flutter_clean_achitecture/presentation/widgets/background.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(),
    );
  }
}
